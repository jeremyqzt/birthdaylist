import 'package:flutter/material.dart';

class Constant {
  // Header bar icons
  static const String Settings = 'Settings';
  static const String People = 'People';

  // Settings drawer choices
  static const List<String> choices = <String>[
    People, // Manage people
    Settings // Manage reminders
    // Sign out?
  ];

  static const choices_icons = {
    People:Icons.contacts,
    Settings:Icons.settings
  };
}
