import 'package:flutter/material.dart';
import 'contact_card.dart';
import 'left_right_text.dart';
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
    return new SingleChildScrollView(
      child: buildList(),
    );
  }

  List<List<Widget>> buildRecentEvents(){
    List<Person> allContacts= this.db.getAllContacts();
    List<List<Widget>> immediately = this.getNext30(allContacts);
    return immediately;
  }

  List<List<Widget>> getNext30(List<Person> contacts){
    List<Event> soon;
    List<Widget> retSoon = [];
    List<Widget> retLater = [];
    List<Widget> retNext = [];

    int EoY = DateTime(DateTime.now().year, 12, 31).difference((DateTime.now())).inDays;
    int dayDiff;
    for (int i = 0; i < contacts.length; i++){
      soon = contacts[i].getMostSoonEvents();
      for (int j = 0; j < soon.length; j++){
        dayDiff = soon[j].getDaysFromToday();
        print(dayDiff);
        if (dayDiff <= 30){
          retSoon.add(new ContactCard(contacts[i].name(), "${soon[j].eventType}", "${soon[j].getDaysFromToday()}"));
        }
        else if(dayDiff <= EoY && dayDiff > 30){
          retLater.add(new ContactCard(contacts[i].name(), "${soon[j].eventType}", "${soon[j].getDaysFromToday()}"));
        }
        else if (dayDiff > EoY){
          retNext.add(new ContactCard(contacts[i].name(), "${soon[j].eventType}", "${soon[j].getDaysFromToday()}"));
        }
      }
    }

    return [retSoon, retLater,  retNext];
  }

  Widget buildList() {
    List<List<Widget>> toUse = this.buildRecentEvents();
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          LeftRightText("⌛ Coming up", "Next 30 days"),
          ...toUse[0],
          SizedBox(height: 25),
          LeftRightText("🎀 Coming Up", "Later this year"),
          ...toUse[1],
          SizedBox(height: 25),
          LeftRightText("🌟 Done!", "All celebrated"),
          ...toUse[2],
        ],
      )
    );
  }
}