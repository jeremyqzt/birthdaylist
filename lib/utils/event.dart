
class Event {
  int eventType;
  DateTime eventTime;
  String eventMessage;
  bool reminder;
  bool earlyReminder;
  bool autoMessage;
  Event(this.eventType, this.eventTime, this.eventMessage, this.reminder, this.earlyReminder, this.autoMessage);

  DateTime getThisYearEvent(){
    DateTime currently = DateTime.now();
    
  }

  String toString() => "Event Type (${this.eventType}) @ ${this.eventTime}. Msg: ${this.eventMessage}";

}