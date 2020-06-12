import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buttonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ButtonBar(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
            ),
            color: Colors.redAccent,
            child: new Text(
              'Delete This Event',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: () => print("Deleting"),

          ),
          new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
            ),
            color: Colors.green,
            child: new Text(
              'Save Changes',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            onPressed: () => print("Saving"),
          ),
        ],
      );
  }
}