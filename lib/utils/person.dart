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
    print(inJson);
  }

  String toString() => "Name (${this.id}): ${this.firstName} ${this.lastName}, Recorded Events: ${this.events}";
}