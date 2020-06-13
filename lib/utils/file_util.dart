import 'dart:async';
import 'dart:convert';
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

  static Future<Map<String, dynamic>> readFile() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      // If encountering an error, return empty json array
      return {};
    }
  }

  static Future<File> writeFile(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$json');
  }
}