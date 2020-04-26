import 'package:flutter/material.dart';

class SteperPage extends StatefulWidget {
  @override
  _SteperPageState createState() => _SteperPageState();
}

class _SteperPageState extends State<SteperPage> {
  int _currentStep = 0;
  List<Step> _mySteps = [
    Step(title: Text('Paso 1'), content: Text('data')),
    Step(title: Text('Paso 2'), content: Text('datadatadata, datadata')),
    Step(title: Text('Paso 3'), content: Text('datadata, datadata, datadatadata')),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: _createStepper(),
    );
  }

  Widget _createStepper() {
    return Container(
      child: Stepper(
        currentStep: _currentStep,
        steps: _mySteps,
        type: StepperType.horizontal,
        onStepContinue: (){
          if(_currentStep + 1 >= _mySteps.length) _currentStep = -1;
          setState(() {
            _currentStep++;
          });
        },
        onStepCancel: (){
          setState(() {
            if(_currentStep > 0) _currentStep--;
          });
        },
        onStepTapped: (step){
          setState(() {
            _currentStep = step;
          });
        },
      )
    );
  }
}