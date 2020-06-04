import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitch createState() => _ToggleSwitch();
}

class _ToggleSwitch extends State<ToggleSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
          value: isSwitched,
          onChanged: (value){
            setState(() {
              isSwitched=value;
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
    );
  }
}