import 'package:lunar_calendar_converter/lunar_solar_converter.dart';

class Event {
  int eventType;
  DateTime eventTime, lunarEventTime;

  String eventMessage;
  bool reminder;
  bool earlyReminder;
  bool autoMessage;
  Event(this.eventType, this.eventTime, this.lunarEventTime, this.eventMessage, this.reminder, this.earlyReminder, this.autoMessage,){
    this.getThisYearEvent();
  }

  DateTime getThisYearEvent(){
    DateTime currently = DateTime.now();
    DateTime nextEvent = new DateTime(currently.year, this.eventTime.month, this.eventTime.day);
    Solar solarEventOrigin = Solar(solarYear: this.eventTime.year, solarMonth: this.eventTime.month, solarDay: this.eventTime.day);
    Lunar lunarEventOrigin = LunarSolarConverter.solarToLunar(solarEventOrigin);


    print("${lunarEventOrigin.lunarYear}, ${lunarEventOrigin.lunarMonth}, ${lunarEventOrigin.lunarDay}");
    return currently;
  }

  String toString() => "Event Type (${this.eventType}) @ ${this.eventTime}. Msg: ${this.eventMessage}";

}