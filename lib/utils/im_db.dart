import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  FileUtil disk;
  String inMemoryDb;

  imDb(){
    this._readDisk();
  }

  convertToJson(String inJson){
    final res = json.decode(inJson);
    print(res["savedEntries"][0]["savedDays"]);
  }
   _readDisk() async{
    this.inMemoryDb = await FileUtil.readFile();
  }

  flushToDisk(){
    FileUtil.writeFile(json.encode(this.inMemoryDb));
  }


}