// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var strength = "0";

  String updateStrength(String strength) {
    setState(() {
      strength = calculateStrength(strength);
    });
    return strength;
  }

  String calculateStrength(strength) {
    int value = 0;
    int digit = 0;
    int upperCase = 0;
    int lowerCase = 0;
    int special = 0;
    int len = strength.length;
    for (int i = 0; i < len; i++) {
      int currASCIIvalue = strength.codeUnitAt(i);
      if (currASCIIvalue > 47 && currASCIIvalue < 58) {
        digit++;
      } else if (currASCIIvalue > 64 && currASCIIvalue < 91) {
        upperCase++;
      } else if (currASCIIvalue > 94 && currASCIIvalue < 121) {
        lowerCase++;
      } else if ((currASCIIvalue > 32 && currASCIIvalue < 48) ||
          (currASCIIvalue > 57 && currASCIIvalue < 65) ||
          (currASCIIvalue > 90 && currASCIIvalue < 97) ||
          (currASCIIvalue > 122 && currASCIIvalue < 127)) {
        special++;
      }
    }
    if (digit > 0) value++;
    if (upperCase > 0) value++;
    if (lowerCase > 0) value++;
    if (special > 0) value++;
    if (len > 9) value++;

    double result = (value * 100) / 5;
    return result.toString();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Strength',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Check Strength"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Card(elevation: 10),
              Text("Welcome User"),
              Card(elevation: 10),
              Card(elevation: 10),
              Text("Strength : $strength %"),
              TextField(
                decoration: InputDecoration(labelText: 'Enter Password'),
                onSubmitted: (val) {
                  strength = updateStrength(val);
                  print(val);
                },
              ),
              Card(
                elevation: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
