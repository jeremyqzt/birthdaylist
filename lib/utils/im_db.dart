import "file_util.dart";
import 'dart:convert';
import 'person.dart';

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

  dynamic getMostRecentEvent(){
    List ret = [];
    dynamic mostRecent;
    dynamic cur;
    for(var i = 0; i <this.allContacts.length; i++){

    }
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