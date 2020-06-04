import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../color_gradient.dart';
import '../toggle_switch.dart';

class DateDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DateDetail();
}

class _DateDetail extends State<DateDetail> {
  int age = 26;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: ListTile(
          onTap: () {
            setState(() {
              this.age += 1;
            });
          },
          leading: ColorGradient(
              child: Icon(
                Icons.cake,
                size: 50,
                color: Colors.white,
              )
          ),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
            child:Text(
              'Turning $age',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
            child: Text(
              '104 Days Until Birthday',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
      ),
        children: [
          ToggleSwitch(),
        ]
    );
  }
}