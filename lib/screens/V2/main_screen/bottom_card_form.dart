import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './added_new_event.dart';

class BottomCardForm extends StatefulWidget {
  BottomCardForm({Key key}) : super(key: key);

  @override
  _BottomCardForm createState() => _BottomCardForm();
}

class _BottomCardForm extends State<BottomCardForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = constantSpecialDayStrings[0];
  String dateVal = 'Select A Date';
  IconData pickedDateType = Feather.moon;
  bool isLunar = false;
  final DateFormat formatter = DateFormat.yMMMMd('en_US');

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      helpText: 'Select the event date!',
      cancelText: 'Cancel',
      confirmText: 'Select',
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
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
            child: AddedNewEventList(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
            child: new Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: new Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.white,
                    ),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: constantSpecialDayStrings
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Event Description',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ]),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: new Row(children: [
                Expanded(
                    child: new OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: selectDate,
                  child: new Text(dateVal),
                )),
                IconButton(
                  icon: Icon(pickedDateType),
                  onPressed: () => {
                    if (pickedDateType == Feather.moon)
                      {
                        setState(() {
                          pickedDateType = Feather.sun;
                        })
                      }
                    else
                      {
                        setState(() {
                          pickedDateType = Feather.moon;
                        })
                      }
                  },
                ),
              ])),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: MaterialButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                onPressed: () {
                  print("Hello");
                },
                child: Text('Add Event'),
              ),
            ),
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
