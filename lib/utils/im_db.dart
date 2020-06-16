import "file_util.dart";
import 'dart:convert';
import '../data/json_struct.dart';

class imDb{
  String fp;
  FileUtil disk;
  String inMemoryDb;

  imDb(){
    this._readDisk();
  }

  static convertToJson(String inJson){
    final res = json.decode(inJson);
    print(res);
  }
   _readDisk() async{
    this.inMemoryDb = await FileUtil.readFile();
  }

  flushToDisk(){
    FileUtil.writeFile(json.encode(this.inMemoryDb));
  }


}