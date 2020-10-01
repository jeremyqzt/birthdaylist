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

  String toString() => "Name (${this.id}): ${this.firstName} ${this.lastName}, Recorded Events: ${this.events}";
}