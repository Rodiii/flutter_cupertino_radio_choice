import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
    'other': 'Other',
  };

  String _selectedGender = genderMap.keys.first;

  @override
  Widget build(BuildContext context) {
    final genderSelectionTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Select Gender',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 15.0,
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          CupertinoRadioChoice(
              choices: genderMap,
              onChange: onGenderSelected,
              initialKeyValue: _selectedGender)
        ],
      ),
    );

    return new Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
          child: Column(children: <Widget>[genderSelectionTile])),
    );
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
