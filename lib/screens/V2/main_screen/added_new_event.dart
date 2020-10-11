import 'package:flutter/material.dart';

class AddedNewEventList extends StatefulWidget {
  _AddedNewEventList createState() => _AddedNewEventList();
}

class _AddedNewEventList extends State<AddedNewEventList> {
  Widget getEmpty() {
    return Row(children: [
      Image.asset(
        "assets/images/note2.jpg",
        height: 100,
        fit: BoxFit.fill,
      ),
      Text("Add some Evets!")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 60,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getEmpty(),
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
      ),
    );
  }
}
