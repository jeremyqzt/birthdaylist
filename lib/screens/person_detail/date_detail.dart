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
    int dateType = this._info["type"];
    String dateString = this._info["date"];
    List<String> msg = supportedDateUtil.buildMsgFromDate(dateString, dateType);
    return ExpansionTile(
        title: ListTile(
          onTap: () {
            setState(() {
              this.age += 1;
            });
          },
          leading: ColorGradient(
              child: Icon(
                supportedDateUtil.getIconFromDay(dateType),
                size: 50,
                color: Colors.white,
              ),
              colorA: Colors.red,
              colorB: Colors.red
          ),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
            child:Text(
              msg[0],
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
            child: Text(
              msg[1],
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