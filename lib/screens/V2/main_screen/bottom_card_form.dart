import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart';
import './added_new_event.dart';

class BottomCardForm extends StatefulWidget {
  BottomCardForm({Key key}) : super(key: key);

  @override
  _BottomCardForm createState() => _BottomCardForm();
}

class _BottomCardForm extends State<BottomCardForm> {
  final _formKey = GlobalKey<FormState>();
  singleEvent dropdownValue = constantSpecialDayStrings[0];
  dateType pickedDateType = dateType(DateTypes.SOLAR);
  Color iconColor = Colors.orangeAccent;
  bool isLunar = false;
  final DateFormat formatter = DateFormat.yMMMMd('en_US');
  String dateVal;

  int dismissIdx;
  List<SingledAddedEvent> savedDates;

  _BottomCardForm() {
    this.dismissIdx = 0;
    this.dateVal = formatter.format(DateTime.now());
    savedDates = [];
  }

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

  onDismiss(int idx) {
    savedDates.removeWhere((element) => element.idx == idx);
    setState(() {
      savedDates = savedDates;
    });
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
            child: AddedNewEventList(savedDates),
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
                    child: DropdownButtonFormField<singleEvent>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (singleEvent newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: constantSpecialDayStrings
                          .map<DropdownMenuItem<singleEvent>>(
                              (singleEvent entry) {
                        return DropdownMenuItem<singleEvent>(
                          value: entry,
                          child: Text(entry.toString()),
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
            child: new Row(
              children: [
                IconButton(
                  color: iconColor,
                  icon: Icon(pickedDateType.getIcon()),
                  onPressed: () {
                    dateType otherType = pickedDateType.getOtherType();
                    setState(() {
                      iconColor = otherType.getColor();
                      pickedDateType = otherType;
                    });
                  },
                ),
                Expanded(
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                    onPressed: selectDate,
                    child: new Text(
                      dateVal,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: MaterialButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.blue,
                    onPressed: () {
                      savedDates.add(new SingledAddedEvent(
                          dateVal,
                          dropdownValue.value,
                          pickedDateType.type,
                          dismissIdx,
                          onDismiss));
                      dismissIdx++;

                      setState(() {
                        savedDates = savedDates;
                      });
                    },
                    child: Text(
                      'Add Event',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
