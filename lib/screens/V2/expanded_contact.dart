import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ExpandedContact extends StatefulWidget {
  ExpandedContact();

  @override
  State<StatefulWidget> createState() {
    return _ExpandedContact();
  }
}

class _ExpandedContact extends State<ExpandedContact> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Color(0xff3a3637),
          title: Text("Jeremy Qian"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 21.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("assets/images/confetti.gif"),
                ),
              ),
            )
          ],
        ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
              ),
            ],
          )
      );
    }
}

