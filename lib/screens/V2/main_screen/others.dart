import 'package:flutter/material.dart';
import 'contact_card.dart';
import 'left_right_text.dart';
import '../common/such_empty.dart';
import "../../../utils/im_db.dart";
import "../../../utils/person.dart";
import "../../../utils/event.dart";

class OthersList extends StatefulWidget {
  imDb db;
  OthersList(this.db);

  @override
  State<StatefulWidget> createState() {
    return _OthersList(this.db);
  }
}

class _OthersList extends State<OthersList> {
  imDb db;
  _OthersList(this.db);

  @override
  Widget build(BuildContext context){
    List<List<Widget>> toUse = this.buildRecentEvents();
    bool isEmpty = toUse[0].length == 0 && toUse[1].length == 0 && toUse[2].length == 0;
    return isEmpty ? SuchEmpty() :
      SingleChildScrollView(
      child: buildList(toUse),
    );
  }

  List<List<Widget>> buildRecentEvents(){
    List<Person> allContacts= this.db.getAllContacts();
    List<List<Widget>> immediately = this.getAllRecentEvents(allContacts);
    return immediately;
  }

  List<List<Widget>> getAllRecentEvents(List<Person> contacts){
    List<Event> soon;
    List<Widget> retSoon = [];
    List<Widget> retLater = [];
    List<Widget> retNext = [];
    String name = "placeholder";

    int EoY = DateTime(DateTime.now().year, 12, 31).difference((DateTime.now())).inDays;
    int dayDiff;
    for (int i = 0; i < contacts.length; i++){
      soon = contacts[i].getMostSoonEvents();
      name = contacts[i].name();
      for (int j = 0; j < soon.length; j++){
        dayDiff = soon[j].getDaysFromToday();
       if (dayDiff <= 30){
          retSoon.add(new ContactCard(name, "${soon[j].eventType}", "${dayDiff}"));
        }
        else if(dayDiff <= EoY && dayDiff > 30){
          retLater.add(new ContactCard(name, "${soon[j].eventType}", "${dayDiff}"));
        }
        else if (dayDiff > EoY){
          retNext.add(new ContactCard(name, "${soon[j].eventType}", "${dayDiff}"));
        }
      }
    }
    return [retSoon, retLater,  retNext];
  }

  Widget buildList(List<List<Widget>> toUse) {

    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (toUse[0].length > 0) LeftRightText("⌛ Coming up", "Next 30 days"),
          ...toUse[0],
          if (toUse[1].length > 0) LeftRightText("🎀 Coming Up", "Later this year"),
          ...toUse[1],
          if (toUse[2].length > 0) LeftRightText("🌟 Done!", "All celebrated"),
          ...toUse[2],
        ],
      )
    );
  }
}