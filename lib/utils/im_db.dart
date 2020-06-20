import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  dynamic jsonDb;
  bool _doneRead;
  imDb(){
    this._doneRead = false;
  }

  operator [](String keyStr) {
    if (this._doneRead){
      return  this.jsonDb[keyStr];
    }
  }

  readDisk() async{
    String assetFile;
    await FileUtil.getAssetFile("assets/config/testData.json").then(
            (asset) {
              assetFile = asset;
              this.__convertToJson(assetFile);
              this._doneRead = true;
            }
    );
  }

  __convertToJson(String inJson){
    this.jsonDb = json.decode(inJson);
  }

  //getAllSavedEntries(){
   // return this.jsonDb["savedEntries"];
  //}

  flushToDisk(){
    FileUtil.writeFile(json.decode(this.jsonDb));
  }


}