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

  List<Widget> buildRecentEvents(){
    List<Person> allContacts= this.db.getAllContacts();
    List<Widget> immediately = this.getNext30(allContacts);
    return immediately;
  }

  List<Widget> getNext30(List<Person> contacts){
    List<Event> soon;
    List<Widget> ret = [];
    for (int i = 0; i < contacts.length; i++){
      soon = contacts[i].getMostSoonEvents();
      for (int j = 0; j < soon.length; j++){
        print(soon[j].getDaysFromToday());
        if (soon[j].getDaysFromToday() <= 60){
          ret.add(new ContactCard(contacts[i].name(), "${soon[j].eventType}", "${soon[j].getDaysFromToday()}"));
        }
      }
    }

    return ret;
  }

  List<Widget> laterInTheYear(List<Person> contacts){

  }



  Widget buildList() {
    List<Widget> toUse = this.buildRecentEvents();
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          LeftRightText("⌛ Coming up", "Next 30 days"),
          ...toUse,
          SizedBox(height: 25),
          LeftRightText("🎀 Coming Up", "Later this year"),
          ContactCard("JQ", "Test", "1"),
          SizedBox(height: 25),
          LeftRightText("🌟 Done!", "All celebrated"),
          ContactCard("JQ", "Test", "1"),
        ],
      )
    );
  }
}