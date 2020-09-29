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
  }

  List<Person> get(dynamic json){
    
  }

  dynamic getMostRecent(){
    List ret = [];
    dynamic mostRecent = null;
    dynamic cur = null;
    for(var i = 0; i < this.jsonDb.length; i++){
      print(this.jsonDb[i]["savedDays"]);
      //cur = this.jsonDb["savedDays"][i]["date"];
      //print(cur);
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