import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../color_gradient.dart';
import '../toggle_switch.dart';
import '../date_picker.dart';
import '../button_list.dart';
import '../../utils/supported_dates.dart';

class DateDetail extends StatefulWidget {
  final dynamic _info;
  DateDetail(this._info);
  @override
  State<StatefulWidget> createState() => _DateDetail(_info);
}

class _DateDetail extends State<DateDetail> {
  final dynamic _info;
  _DateDetail(this._info);

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
                supportedDateUtil.getIconFromDay(this._info["type"]),
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
          DatePickerButton(),
          ToggleSwitch("Remind Me On The Day", Icons.add_alarm),
          ToggleSwitch("Remind Me A Few Days In Advance", Icons.alarm_on),
          ToggleSwitch("Automatically Send Birthday Wishes", Icons.adb),
          buttonList()
        ]
    );
  }
}