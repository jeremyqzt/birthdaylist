import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  ContactCard();

  @override
  State<StatefulWidget> createState() {
    return _ContactCard();
  }
}

class _ContactCard extends State<ContactCard> {
  String renderUrl;

  Widget get contactCardIndividual {
    return
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          elevation: 5.0,
          color: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.album),
                ),
              ]
          )
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top:15),
      child:  contactCardIndividual,
    );
  }
}