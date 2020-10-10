import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomCardForm extends StatefulWidget {
  BottomCardForm({Key key}) : super(key: key);

  @override
  _BottomCardForm createState() => _BottomCardForm();
}

class _BottomCardForm extends State<BottomCardForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Birthday';
  String dateVal = 'Select A Date';
  String pickedDateType = '☀';
  bool isLunar = false;
  final DateFormat formatter = DateFormat.yMMMMd('en_US');

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    if (picked != null) setState(() => dateVal = formatter.format(picked));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30, top: 30, bottom: 10),
            child: new Row(children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Row(children: [
              DropdownButton<String>(
                dropdownColor: Colors.white,
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 1,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Birthday', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Expanded(
                  child: new RaisedButton(
                onPressed: selectDate,
                child: new Text(dateVal),
              )),
              Switch(
                value: isLunar,
                onChanged: (value) {
                  String newSymbol = "☀";
                  if (value) {
                    print("setting");
                    newSymbol = "🌙";
                  }
                  setState(() {
                    isLunar = value;
                    pickedDateType = newSymbol;
                  });
                },
                inactiveThumbColor: Colors.orange,
                inactiveTrackColor: Colors.orange,
                activeTrackColor: Colors.yellowAccent,
                activeColor: Colors.yellow,
              ),
              new Text(pickedDateType)
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Save Contact'),
            ),
          ),
        ],
      ),
    );
  }
}
