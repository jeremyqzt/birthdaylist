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
                      return 'Field cannot be empty';
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
                    if (value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
            ]),
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                          style: BorderStyle.solid)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: Column(children: [
                      AddedNewEventList(savedDates),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
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
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                            color: iconColor,
                            icon: Icon(pickedDateType.getIcon()),
                            onPressed: () {
                              dateType otherType =
                                  pickedDateType.getOtherType();
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
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
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
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 40,
                top: 0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  color: Colors.white,
                  child: Text(
                    'Recorded Events',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )),
          ]),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: MaterialButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Save Contact',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
