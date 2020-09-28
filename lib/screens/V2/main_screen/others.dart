import 'package:flutter/material.dart';
import 'contact_card.dart';
import 'left_right_text.dart';
import "../../../utils/im_db.dart";

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

  Widget buildList() {
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          LeftRightText("⌛ Coming up", "Within the next 30 days!"),
          ContactCard(),
          ContactCard(),
          SizedBox(height: 25),
          LeftRightText("🎀 Coming Up", "Later in the year"),
          ContactCard(),
          SizedBox(height: 25),
          LeftRightText("🌟 Done!", "All Events celebrated!"),
          ContactCard(),
        ],
      )
    );
  }
}