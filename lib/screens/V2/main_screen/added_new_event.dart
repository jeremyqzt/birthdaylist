import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class AddedNewEventList extends StatefulWidget {
  List<Widget> eventList;

  AddedNewEventList(this.eventList);

  _AddedNewEventList createState() => _AddedNewEventList(this.eventList);
}

class _AddedNewEventList extends State<AddedNewEventList> {
  final _scrollController = ScrollController();

  List<Widget> eventList;

  _AddedNewEventList(this.eventList);

  Widget getEmpty() {
    return Row(children: [
      Image.asset(
        "assets/images/note2.jpg",
        height: 150,
        fit: BoxFit.fill,
      ),
      Expanded(
        child: new Column(children: [
          Text(
            "📝 All Empty Here",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Text(
            "Create new events below",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ]),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> toRender;
    if (this.eventList.length == 0) {
      toRender = [getEmpty()];
    } else {
      toRender = [...this.eventList];
    }
    print(toRender);
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 60,
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...toRender,
            ],
          ),
        ),
      ),
    );
  }
}

class AddedNewEvent extends StatelessWidget {
  final int idx;
  final String date;
  final SpecialDays type;
  final DateTypes dateType;
  final void Function(int idx) dismissCallback;

  AddedNewEvent(
      this.date, this.type, this.dateType, this.idx, this.dismissCallback);

  getIdx() => this.idx;

  String getEventDescription() {
    String symbol = (dateType == DateTypes.LUNAR) ? "🌙" : "☀";
    return '${EventIcon[type]} ${EventMap[type]} on ${symbol} ${this.date}';
  }

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
        dismissThresholds: {
          DismissDirection.startToEnd: 0.3,
          DismissDirection.endToStart: 0.7
        },
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          this.dismissCallback(this.idx);
        },
        key: Key("${this.idx}"),
        child: Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(1.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                this.getEventDescription(),
              ),
            )));
  }
}
