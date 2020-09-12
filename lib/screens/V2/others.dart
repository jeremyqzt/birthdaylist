import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_icons/flutter_icons.dart';

import './contact_card.dart';
class OthersList extends StatefulWidget {
  OthersList();

  @override
  State<StatefulWidget> createState() {
    return _OthersList();
  }
}

class _OthersList extends State<OthersList> {

  Widget build(BuildContext context){
    return new SingleChildScrollView(
      child: buildList(),
    );
  }

  @override
  Widget buildList() {
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          Text(
            '⌛ Coming up - Within the next 30 days!',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ContactCard(),
          ContactCard(),
          SizedBox(height: 25),
          Text(
            '🎀 Coming Up - Later in the year',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ContactCard(),
          SizedBox(height: 25),
          Text(
            '🌟 Done! - Event celebrated already!',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ContactCard(),
        ],
      )
    );
  }
}