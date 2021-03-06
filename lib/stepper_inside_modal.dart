import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc.dart';
import 'const.dart';
import 'multi_select_chip.dart';

final _dateFormat = DateFormat.yMMMd();

class StepperInsideModal extends StatefulWidget {
  const StepperInsideModal({Key key}) : super(key: key);

  @override
  _StepperInsideModalState createState() => _StepperInsideModalState();
}

class _StepperInsideModalState extends State<StepperInsideModal> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController _originCityCtrl = TextEditingController();
  final TextEditingController _originCountryCtrl = TextEditingController();

  RangeValues _currentRangeValues = const RangeValues(1000, 2000);

  DateTime selectedDate = DateTime.now();
  DateTime selectedDateReturn = DateTime.now();

  List<String> selectedChoices = [];

  int _nAdult = 0;
  int _nChild = 0;
  int _nBaby = 0;

  @override
  Widget build(BuildContext rootContext) {
    final List<CoolStep> steps = [
      //
      //  Starting place
      //  Section concernant le point de départ du projet
      //  On définit le pays mais également la ville de départ.

      //  Objectifs :
      //    calculer des distances entre le point de départ et les destinations
      //    trouver l'aéroport le plus proche
      //    déduire les dates des vacances scolaires

      CoolStep(
        title: 'Starting place',
        subtitle: "What's your starting place for this project ?",
        content: Form(
          key: _formKey1,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Country',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Country is required';
                  }
                  return null;
                },
                controller: _originCountryCtrl,
              ),
              _buildTextField(
                labelText: 'City',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
                controller: _originCityCtrl,
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey1.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),

      // Participant
      // Section concernant les participants au projet.
      // Nous cherchons à comprendre combien ils seront et
      // si des enfants/nourissons seront présents

      // Objectifs :
      //   Eliminer des destinations pas adaptées pour des enfants

      CoolStep(
        title: 'Participant',
        subtitle: 'Who is going to participate to the project ?',
        content: Column(children: <Widget>[
          _buildParticipantField(labelText: 'Adult', participantCode: 'ADULT'),
          const SizedBox(
            height: 10,
          ),
          _buildParticipantField(labelText: 'Child', participantCode: 'CHILD'),
          const SizedBox(
            height: 10,
          ),
          _buildParticipantField(labelText: 'Baby', participantCode: 'BABY')
        ]),
        validation: () {
          return null;
        },
      ),

      // Interests
      // Section concernant les différents centre d'intérêt important
      // pour ce projet.
      // La liste des activités disponibles se trouvent dans le fichier const.dart

      // Objectifs :
      //   déduire les lieux les plus appropriés et ceux qui ne le sont pas

      CoolStep(
        title: 'Interests',
        subtitle:
            'What are your main interests and expectations for this project ?',
        content: Form(
          key: _formKey2,
          child: Column(
            children: [
              Wrap(spacing: 4, children: [
                MultiSelectChip(
                  reportList: preferenceList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedChoices = selectedList;
                    });
                  },
                ),
              ]
// https://karthikponnam.medium.com/flutter-multi-select-choicechip-244ea016b6fa
                  ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey2.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),

      // Date
      // Section concernant les dates de début et de fin du projet

      // Objectifs :
      //   Comprendre combien de temps va durer le projet (week-end, semaine, mois)
      //   Déduire les lieux où la météo sera la plus clémente
      //   Période de vacances scolaires ?

      CoolStep(
        title: 'Date',
        subtitle: "What's the period you want to travel ?",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'From : ${_dateFormat.format(selectedDate)}',
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: const Text(
                    'Select',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'To : ${_dateFormat.format(selectedDateReturn)}',
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () =>
                      _selectDateReturn(context, selectedDate), // Refer step 3
                  child: const Text(
                    'Select',
                  ),
                ),
              ],
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),

      // Budget
      // Section concernant le budget prévu pour réaliser le projet

      // Objectifs :
      //   exclure des destinations au-dessus du budget
      //   privilégier certains types de transport dans nos propositions

      CoolStep(
        title: 'Budget',
        subtitle: "What's your estimated budget for this project ?",
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _currentRangeValues.start.round().toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: RangeSlider(
                    values: _currentRangeValues,
                    min: 100,
                    max: 10000,
                    divisions: 99900,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ),
                Text(
                  _currentRangeValues.end.round().toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      onCompleted: () {
        //
        // Insertion ici des informations validées en base de données
        // Les informations se trouvent dans les controler et peuvent
        // être facilement retrouvées

        BlocProvider.of<ApplicationBloc>(context).insertParameter(
            _originCityCtrl.text,
            _originCountryCtrl.text,
            selectedChoices.toString(),
            _nAdult,
            _nChild,
            _nBaby,
            _currentRangeValues.start.round(),
            _currentRangeValues.end.round(),
            selectedDate,
            selectedDateReturn,
            DateTime.now());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Project successfully created'),
          ),
        );

        Navigator.of(rootContext).pop();
      },
      steps: steps,
      config: const CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(),
        middle: const Text('Project creation'),
      ),
      child: SafeArea(
        bottom: false,
        child: stepper,
      ),
    ));
  }

  /// Incrémente le nombre de participants en fonction de [person]
  void addSomeone(String person) {
    switch (person) {
      case 'ADULT':
        setState(() {
          _nAdult++;
        });
        break;
      case 'CHILD':
        setState(() {
          _nChild++;
        });
        break;
      case 'BABY':
        setState(() {
          _nBaby++;
        });
        break;
      default:
        break;
    }
  }

  /// Décrémente le nombre de participants en fonction de [person]
  void minusSomeone(String person) {
    switch (person) {
      case 'ADULT':
        setState(() {
          if (_nAdult != 0) {
            _nAdult--;
          }
        });
        break;
      case 'CHILD':
        setState(() {
          if (_nChild != 0) {
            _nChild--;
          }
        });
        break;
      case 'BABY':
        setState(() {
          if (_nBaby != 0) {
            _nBaby--;
          }
        });
        break;
      default:
        break;
    }
  }

  /// Permet de sélectionner une date de départ
  dynamic _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  /// Permet de sélectionner une date de retour
  dynamic _selectDateReturn(BuildContext context, DateTime fromDate) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: fromDate.add(const Duration(days: 7)), // Refer step 1
      firstDate: fromDate,
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDateReturn) {
      setState(() {
        selectedDateReturn = picked;
      });
    }
  }

  /// Retourne la ligne avec tous les éléments d'un participant
  /// La ligne est créée dynamiquement en fonction de [participantCode]
  /// Le libellé repris est celui donné dans le paramètre [labelText]
  Widget _buildParticipantField({
    String labelText,
    String participantCode,
  }) {
    return Row(
      children: <Widget>[
        Text(labelText),
        const Spacer(),
        OutlinedButton(
          onPressed: () {
            minusSomeone(participantCode);
          },
          child: const Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: _buildParticipantCounter(participantCode: participantCode),
        ),
        OutlinedButton(
          onPressed: () {
            addSomeone(participantCode);
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  /// Retourne le widget du compteur en fonction du [participantCode]
  Widget _buildParticipantCounter({String participantCode}) {
    String participantCounter;

    switch (participantCode) {
      case 'ADULT':
        participantCounter = '$_nAdult';
        break;
      case 'CHILD':
        participantCounter = '$_nChild';
        break;
      case 'BABY':
        participantCounter = '$_nBaby';
        break;
      default:
        break;
    }

    return Text(
      participantCounter,
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget _buildTextField({
    String labelText,
    FormFieldValidator<String> validator,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }
}
