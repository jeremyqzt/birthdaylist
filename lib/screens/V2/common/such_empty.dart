import 'package:flutter/material.dart';

class SuchEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        SizedBox(height: 40,),
        Text(
            "Nothing but clear seas, captain!",
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        Image.asset("assets/images/island.jpg"),
        Text(
          "Get started by adding a new contact or importing existing ones.",
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,),
      ],
    );
  }
}