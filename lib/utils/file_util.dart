import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// https://flutter.dev/docs/cookbook/persistence/reading-writing-files
/*
    Usage:
    FileUtil.writeBirthday('{"jeremy":"1994-10-26"}');
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

  static Future<Map<String, dynamic>> readBirthday() async {
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

  static Future<File> writeBirthday(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$json');
  }
}