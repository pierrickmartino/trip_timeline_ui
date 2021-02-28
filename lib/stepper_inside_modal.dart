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
  String selectedRole = 'Writer';
  final TextEditingController _originCityCtrl = TextEditingController();
  final TextEditingController _originCountryCtrl = TextEditingController();

  RangeValues _currentRangeValues = const RangeValues(1000, 2000);
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateReturn = DateTime.now();
  bool isSelected = false;

  List<String> selectedChoices = [];

  int _nAdult = 0;
  int _nChild = 0;
  int _nBaby = 0;


  @override
  Widget build(BuildContext rootContext) {
    final List<CoolStep> steps = [
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

/** https://karthikponnam.medium.com/flutter-multi-select-choicechip-244ea016b6fa */

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
      CoolStep(
        title: 'Budget',
        subtitle: "What's your estimated budget for this project ?",
        content: Column(
          children: [
            RangeSlider(
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
          ],
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Date',
        subtitle: "What's the period you want to travel ?",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'From : ${_dateFormat.format(selectedDateReturn)}',
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _selectDateReturn(context), // Refer step 3
                  child: const Text(
                    'Select date',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'To : ${_dateFormat.format(selectedDate)}',
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: const Text(
                    'Select date',
                  ),
                ),
              ],
            )
          ],
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Participant',
        subtitle: 'Who is going to participate to the project ?',
        content: 
        Column(
          children:<Widget>[
Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Text(
                  'Adult',
                ),

            FloatingActionButton(
              onPressed: minusAdult,
              child: new Icon(
               Icons.remove,
                 color: Colors.black),
              backgroundColor: Colors.white,),


            Text('$_nAdult',
                style: new TextStyle(fontSize: 20.0)),

FloatingActionButton(
              onPressed: addAdult,
              child: new Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.white,),


          ],
        ),
        SizedBox(
          height:10,
        ),
Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Text(
                  'Child',
                ),

            FloatingActionButton(
              onPressed: minusChild,
              child: new Icon(
               Icons.remove,
                 color: Colors.black),
              backgroundColor: Colors.white,),


            Text('$_nChild',
                style: new TextStyle(fontSize: 20.0)),

FloatingActionButton(
              onPressed: addChild,
              child: new Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.white,),


          ],
        ),SizedBox(
          height:10,
        ),
Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Text(
                  'Baby',
                ),

            FloatingActionButton(
              onPressed: minusBaby,
              child: new Icon(
               Icons.remove,
                 color: Colors.black),
              backgroundColor: Colors.white,),


            Text('$_nBaby',
                style: new TextStyle(fontSize: 20.0)),

FloatingActionButton(
              onPressed: addBaby,
              child: new Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.white,),


          ],
        ),

          ]
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      onCompleted: () {
        //print(_originCityCtrl.text);

        /** 
         * Insertion ici des informations validées en base de données  
         * Les informations se trouvent dans les controler et peuvent 
         * être facilement retrouvées
        */

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

  void addAdult() {
  setState(() {
    _nAdult++;
  });
}

  void addChild() {
  setState(() {
    _nChild++;
  });
}

  void addBaby() {
  setState(() {
    _nBaby++;
  });
}


void minusAdult() {
  setState(() {
    if (_nAdult != 0) 
      _nAdult--;
  });
}

void minusChild() {
  setState(() {
    if (_nChild != 0) 
      _nChild--;
  });
}

void minusBaby() {
  setState(() {
    if (_nBaby != 0) 
      _nBaby--;
  });
}

  dynamic _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  dynamic _selectDateReturn(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDateReturn, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDateReturn) {
      setState(() {
        selectedDateReturn = picked;
      });
    }
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

  Widget _buildSelector({
    BuildContext context,
    String name,
  }) {
    final bool isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
