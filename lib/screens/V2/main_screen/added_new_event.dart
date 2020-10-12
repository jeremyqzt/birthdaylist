import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class AddedNewEventList extends StatefulWidget {
  List<AddedNewEvent> eventList;

  AddedNewEventList(this.eventList);

  _AddedNewEventList createState() => _AddedNewEventList(this.eventList);
}

class _AddedNewEventList extends State<AddedNewEventList> {
  final _scrollController = ScrollController();

  List<AddedNewEvent> eventList;

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
              //getEmpty(),
              /*AddedNewEvent(
                  "Oct-10-2020", SpecialDays.BIRTHDAY, DateTypes.SOLAR),
              AddedNewEvent(
                  "Oct-10-2020", SpecialDays.ANNIVERSARY, DateTypes.LUNAR),
              AddedNewEvent(
                  "Oct-10-2020", SpecialDays.HOLIDAY, DateTypes.SOLAR),
              AddedNewEvent(
                  "Oct-10-2020", SpecialDays.ROUTINE, DateTypes.LUNAR),*/
            ],
          ),
        ),
      ),
    );
  }
}

class AddedNewEvent extends StatelessWidget {
  final String date;
  final SpecialDays type;
  final DateTypes dateType;

  AddedNewEvent(this.date, this.type, this.dateType);

  String getEventDescription() {
    String symbol = (dateType == DateTypes.LUNAR) ? "🌙" : "☀";
    return '${EventIcon[type]} ${EventMap[type]} on ${symbol} ${this.date}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(
            this.getEventDescription(),
          ),
        ));
  }
}
