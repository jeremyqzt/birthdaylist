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
    Lunar LunarDay;
    Solar lunarConverted;
    DateTime standard;
    if (this.dayType == DateTypes.LUNAR.index){
      LunarDay = Lunar(lunarYear: this.inJson["year"], lunarMonth: this.inJson["month"], lunarDay: this.inJson["day"]);
      lunarConverted = LunarSolarConverter.lunarToSolar(LunarDay);
      standard = DateTime(currently.year, lunarConverted.solarMonth, lunarConverted.solarDay);

    } else {
      standard = DateTime(currently.year, this.inJson["month"], this.inJson["day"]);
    }

    if (currently.isAfter(standard)){
      return null;
    }
    return standard;
  }

  String toString() => "Event Type (${this.eventType}). Msg: ${this.eventMessage}";

}