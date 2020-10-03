import './event.dart';

class Person {
  String firstName;
  String lastName;
  int id;
  int relationshop;
  List<Event> events;

  Person(String first, String last, int id, int rel, dynamic events){
    this.firstName = first;
    this.lastName = last;
    this.id = id;
    this.relationshop = rel;
    this.events = buildEvents(events);
    //this.getMostSoonEvents();
  }

  List<Event> buildEvents(dynamic inJson){
    List<Event> ret = [];
    Event item;

    for(var i = 0; i < inJson.length; i++){
      item = new Event(inJson[i]);
      ret.add(item);
    }

    return ret;
  }

  List<Event> getMostSoonEvents(){
    int diff;
    List<Event> ret = [];
    int minimum = 365;
    for(var i = 0; i <  this.events.length; i++){
      diff = this.events[i].getDaysFromToday();
      if (diff < minimum){
        ret = [this.events[i]];
        minimum = diff;
      } else if(diff == minimum){
        ret.add(this.events[i]);
      }
    }
    return ret;
  }

  String name() => "${this.firstName} ${this.lastName}";

  String toString() => "${this.firstName} ${this.lastName} (${this.id})";
}