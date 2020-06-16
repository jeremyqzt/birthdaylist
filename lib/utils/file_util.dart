import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// https://flutter.dev/docs/cookbook/persistence/reading-writing-files
/*
    Usage:
    FileUtil.writeBirthday('{"jeremy":"1990-01-01"}');
    FileUtil.readBirthday();
 */
class FileUtil {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/birthdays.json');
  }

  static Future<String> getAssetFile(String path) async {
    return await rootBundle.loadString(path);
  }

  static Future readFile() async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/birthdays.json');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }


  static Future readCustomFile(String fileName) async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File(fileName);
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }

  static Future<File> writeFile(String json) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/birthdays.json');
    await file.writeAsString(json);
  }
}