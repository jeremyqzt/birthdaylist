import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  FileUtil disk;
  String inMemoryDb;

  imDb(){
    this._readDisk();
  }

  _readDisk() async{
    String assetFile = await FileUtil.getAssetFile("assets/config/testData.json");
    this.__convertToJson(assetFile);
    //FileUtil.writeFile('{"Jeremy": True}');
    //String t;
    //t = await FileUtil.readFile();
    //print(t);
  }

  __convertToJson(String inJson){
    final res = json.decode(inJson);
    print(res["savedEntries"][0]["savedDays"]);
  }

  flushToDisk(){
    FileUtil.writeFile(json.encode(this.inMemoryDb));
  }


}