import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class AddedNewEventList extends StatefulWidget {
  List<SingledAddedEvent> eventList;

  AddedNewEventList(this.eventList);

  _AddedNewEventList createState() => _AddedNewEventList(this.eventList);
}

class _AddedNewEventList extends State<AddedNewEventList> {
  final _scrollController = ScrollController();

  List<SingledAddedEvent> eventDataList;
  List<AddedNewEvent> eventList = [];

  _AddedNewEventList(this.eventDataList) {
    this.buildEventList();
  }

  buildEventList() {
    this.eventList = [];
    for (int i = 0; i < this.eventDataList.length; i++) {
      this.eventList.add(new AddedNewEvent(
          this.eventDataList[i].date,
          this.eventDataList[i].type,
          this.eventDataList[i].dateType,
          this.eventDataList[i].idx,
          this.eventDataList[i].dismissCallback));
    }
  }

  Widget getEmpty() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      /*Image.asset(
        "assets/images/note2.jpg",
        height: 150,
        fit: BoxFit.fill,
      ),*/
      SizedBox(
        height: 150,
      ),
      Expanded(
        child:
            new Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    this.buildEventList();
    if (this.eventList.length == 0) {
      toRender = [getEmpty()];
    } else {
      toRender = [...this.eventList];
    }
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 60,
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ...toRender,
            ],
          ),
        ),
      ),
    );
  }
}

class SingledAddedEvent {
  final int idx;
  final String date;
  final SpecialDays type;
  final DateTypes dateType;
  final void Function(int idx) dismissCallback;

  SingledAddedEvent(
      this.date, this.type, this.dateType, this.idx, this.dismissCallback);
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
    return new Container(
      child: new Dismissible(
        dismissThresholds: {
          DismissDirection.startToEnd: 0.7,
          DismissDirection.endToStart: 0.7
        },
        background: Container(
          width: double.infinity,
          color: Colors.red,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Delete',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          this.dismissCallback(this.idx);
        },
        key: Key("${this.idx}"),
        child: Container(
          width: double.infinity,
          child: Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(1.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                this.getEventDescription(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
