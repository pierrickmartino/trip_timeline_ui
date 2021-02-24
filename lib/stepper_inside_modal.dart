import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class StepperInsideModal extends StatefulWidget {
  const StepperInsideModal({Key key}) : super(key: key);

  @override
  _StepperInsideModalState createState() => _StepperInsideModalState();
}

class _StepperInsideModalState extends State<StepperInsideModal> {
  final _formKey = GlobalKey<FormState>();
  String selectedRole = 'Writer';
  final TextEditingController _originCityCtrl = TextEditingController();
  final TextEditingController _originCountryCtrl = TextEditingController();

  @override
  Widget build(BuildContext rootContext) {
    final List<CoolStep> steps = [
      CoolStep(
        title: 'Point de départ',
        subtitle: "D'où souhaitez-vous démarrer votre voyage ?",
        content: Form(
          key: _formKey,
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
          if (!_formKey.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Select your role',
        subtitle: 'Choose a role that better defines you',
        content: Row(
          children: <Widget>[
            _buildSelector(
              context: rootContext,
              name: 'Writer',
            ),
            const SizedBox(width: 5),
            _buildSelector(
              context: rootContext,
              name: 'Editor',
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
        //print(_originCityCtrl.text);

        /** 
         * Insertion ici des informations validées en base de données  
         * Les informations se trouvent dans les controler et peuvent 
         * être facilement retrouvées
        */

        BlocProvider.of<ApplicationBloc>(context).insertParameter(
            _originCityCtrl.text,
            _originCountryCtrl.text,
            'preference',
            1,
            2,
            3,
            1500,
            null,
            null,
            DateTime.now());

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
        middle: const Text('Modal Page'),
      ),
      child: SafeArea(
        bottom: false,
        child: stepper,
      ),
    ));
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
