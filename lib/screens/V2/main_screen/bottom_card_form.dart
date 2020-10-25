import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/constants.dart';
import './added_new_event.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
  File _image;

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

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
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
                left: 15.0, right: 30, top: 30, bottom: 10),
            child: new Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                  _imgFromGallery();
                },
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue,
                  child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                          child: Image.file(
                            _image,
                            width: 65,
                            height: 65,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                    width: 65,
                    height: 65,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              ),
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
                left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
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
            child: Row(children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              RaisedButton(
                onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Save Contact'),
            ),
                ]),
          ),
        ],
      ),
    );
  }
}
