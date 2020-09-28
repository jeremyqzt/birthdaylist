import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  dynamic jsonDb;
  imDb();

  operator [](String keyStr) {
    return  this.jsonDb[keyStr];
  }

  readDisk() async{
    String assetFile;
    await FileUtil.getAssetFile("assets/config/testData.json").then(
            (asset) => {
              this.__convertToJson(asset)
            }
    );
  }

  dynamic getMostRecent(){
    dynamic mostRecent = null;
    dynamic cur = null;
    for(var i = 0; i < this.jsonDb.length; i++){
      print(this.jsonDb[i]["savedDays"]);
      //cur = this.jsonDb["savedDays"][i]["date"];
      //print(cur);
    }
  }

  __convertToJson(String inJson){
    this.jsonDb = json.decode(inJson)["savedEntries"];
  }

  //getAllSavedEntries(){
   // return this.jsonDb["savedEntries"];
  //}

  flushToDisk(){
    FileUtil.writeFile(json.decode(this.jsonDb));
  }


}