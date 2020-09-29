
class Event {
  int eventType;
  DateTime eventTime;
  String eventMessage;
  bool reminder;
  bool earlyReminder;
  bool autoMessage;
  Event(this.eventType, this.eventTime, this.eventMessage, this.reminder, this.earlyReminder, this.autoMessage);
}