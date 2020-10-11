import 'package:flutter/material.dart';

class AddedNewEventList extends StatefulWidget {
  _AddedNewEventList createState() => _AddedNewEventList();
}

class _AddedNewEventList extends State<AddedNewEventList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 60,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AddedNewEvent(),
            AddedNewEvent(),
            AddedNewEvent(),
            AddedNewEvent(),
          ],
        ),
      ),
    );
  }
}

class AddedNewEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Text(
        'Card with circular border',
        textScaleFactor: 1.2,
      ),
    );
  }
}
