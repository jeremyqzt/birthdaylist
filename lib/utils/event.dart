import 'package:lunar_calendar_converter/lunar_solar_converter.dart';
import 'constants.dart';

class Event {
  dynamic inJson;
  int eventType, year, month, day;
  int dayType;

  String eventMessage, title;
  bool reminder;
  bool earlyReminder;
  bool autoMessage;
  Event(this.inJson){
    this.buildInternal();
    this.getThisYearEvent();
  }

  void buildInternal(){
    this.dayType = this.inJson["dateType"];
    this.eventType = this.inJson["type"];
    this.eventMessage = this.inJson["messageContent"];
  }

  DateTime getThisYearEvent(){
    DateTime currently = DateTime.now();

    return currently;
  }

  String toString() => "Event Type (${this.eventType}). Msg: ${this.eventMessage}";

}