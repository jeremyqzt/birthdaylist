import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class OthersList extends StatefulWidget {
  OthersList();

  @override
  State<StatefulWidget> createState() {
    return _OthersList();
  }
}

class _OthersList extends State<OthersList> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  contactCardIndividual,
    );
  }
}