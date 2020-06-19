import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  dynamic jsonDb;
  FileUtil disk;
  String inMemoryDb;

  imDb(){
    //this._readDisk();
  }

  operator [](String keyStr) => this.jsonDb[keyStr];
  readDisk() async{
    String assetFile = await FileUtil.getAssetFile("assets/config/testData.json");
    this.__convertToJson(assetFile);
    //FileUtil.writeFile('{"Jeremy": True}');
    //String t;
    //t = await FileUtil.readFile();
    //print(t);
  }

  __convertToJson(String inJson){
    this.jsonDb = json.decode(inJson);
  }

  getAllSavedEntries(){
    return this.jsonDb["savedEntries"];
  }

  flushToDisk(){
    FileUtil.writeFile(json.encode(this.inMemoryDb));
  }


}