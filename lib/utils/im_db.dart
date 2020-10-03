import "file_util.dart";
import 'dart:convert';
import 'person.dart';
import 'event.dart';
import 'dart:collection';

class imDb{
  String fp;
  dynamic jsonDb;
  List<Person> allContacts;

  imDb();

  operator [](String keyStr) {
    return  this.jsonDb[keyStr];
  }

  readDisk() async{
    await FileUtil.getAssetFile("assets/config/testData.json").then(
       (asset) => {
         this.jsonDb = this.__convertToJson(asset)
       }
    );
    this.allContacts = this.enumeratePersons();
  }

  List<Person> enumeratePersons(){
    List<Person> ret = [];
    Person item ;
    for(var i = 0; i < this.jsonDb.length; i++){
      item = new Person(this.jsonDb[i]["firstName"], this.jsonDb[i]["lastName"], this.jsonDb[i]["id"], null, this.jsonDb[i]["savedDays"]);
      ret.add(item);
    }

    return ret;
  }

  List<Person> getAllContacts() => this.allContacts;

  HashMap<Person, List<Event>> getMostRecentEventBetweenAllContacts(){
    HashMap ret = new HashMap<Person, List<Event>>();

    DateTime currently = DateTime.now();
    int minimum = 365;
    int diff;
    List<Event> mostRecent = [];
    for(var i = 0; i <this.allContacts.length; i++){
      mostRecent = this.allContacts[i].getMostSoonEvents();
      if (mostRecent.length > 0){
        diff = mostRecent[0].getThisYearEvent().difference(currently).inDays;
        if (diff < minimum){
          minimum = diff;
          //Removes all elements
          ret.removeWhere((key, value) => true);
          ret[this.allContacts[i]] = mostRecent;

        } else if (diff == minimum){
          ret[this.allContacts[i]] = mostRecent;
        }
      }
    }

    return ret;
  }

  __convertToJson(String inJson){
    return json.decode(inJson)["savedEntries"];
  }

  getRawEntries(){
    return this.jsonDb;
  }

  flushToDisk(){
    FileUtil.writeFile(json.decode(this.jsonDb));
  }
}