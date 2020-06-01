import 'package:birthdaylist/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main_header.dart';
import './date_detail.dart';
import '../date_picker.dart';
import '../../screens/settings/settings.dart';

class PersonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jeremy Q.'),
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: (val) => choiceAction(val, context),
                itemBuilder: (BuildContext context) {
                  return Constant.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      //child: Text(choice)
                      child: Row(
                        children: <Widget>[
                          Icon(Constant.choices_icons[choice],
                              size: 15, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(choice),
                          ),
                        ],
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 5.0),
                    );
                  }).toList();
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainHeader(),
            DateDetail(),
            DateDetail(),
            DatePickerButton(),
          ],
        ));
  }

  void choiceAction(String choice, BuildContext context) {
    switch (choice) {
      case Constant.Settings:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case Constant.People:
        print("people!");
        break;
    }
  }
}
