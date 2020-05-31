import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DateDetail extends StatefulWidget {
  DateDetail({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DateDetail createState() => new _DateDetail();
}

class _DateDetail extends State<DateDetail> {
  var finaldate;
  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: finaldate == null
                  ? Text(
                "Use below button to Select a Date",
                textScaleFactor: 2.0,
              )
                  : Text(
                "$finaldate",
                textScaleFactor: 2.0,
              ),
            ),
            new RaisedButton(
              onPressed: callDatePicker,
              color: Colors.blueAccent,
              child:
              new Text('Click here', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
