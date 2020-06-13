import "file_util.dart";
import 'dart:convert';

class imDb{
  String fp;
  FileUtil disk;
  Map<String, dynamic> inMemoryDb;

  imDb({this.fp}){
    this._readDisk();
  }

   _readDisk() async{
    this.inMemoryDb = await FileUtil.readFile();
  }

  flushToDisk(){
    FileUtil.writeFile(json.encode(this.inMemoryDb));
  }


}