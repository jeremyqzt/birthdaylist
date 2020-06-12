import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  final String toggleDescription;
  final IconData toggleIcon;

  ToggleSwitch(
      this.toggleDescription, this.toggleIcon
      );

  @override
  _ToggleSwitch createState() => _ToggleSwitch(this.toggleDescription, this.toggleIcon);
}

class _ToggleSwitch extends State<ToggleSwitch> {
  bool isSwitched = false;
  final String _descr;
  final IconData _icon;

  _ToggleSwitch(this._descr, this._icon);  //constructor

  @override
  Widget build(BuildContext context) {
    return
      SwitchListTile(
        title: new Text(this._descr),
        secondary: new Icon(
            this._icon
        ),
        value: isSwitched,
        onChanged: (value){
          setState(() {
            isSwitched=value;
          });
        },
        activeTrackColor: Colors.lightBlueAccent,
        activeColor: Colors.blue,
      );
  }
}