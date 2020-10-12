import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class singleEvent {
  final SpecialDays value;

  singleEvent(this.value);

  int toIndex() => this.value.index;

  String toString() => EventMap[this.value];
}

class dateType {
  DateTypes type;

  dateType(this.type);

  IconData getIcon() {
    return (this.type == DateTypes.LUNAR) ? Feather.moon : Feather.sun;
  }

  setType(DateTypes newType) {
    this.type = newType;
  }

  dateType getOtherType() {
    return dateType(
        (this.type == DateTypes.LUNAR) ? DateTypes.SOLAR : DateTypes.LUNAR);
  }

  Color getColor() {
    return (this.type == DateTypes.LUNAR)
        ? Colors.blueGrey
        : Colors.orangeAccent;
  }
}

enum SpecialDays {
  NOTHING,
  BIRTHDAY,
  ANNIVERSARY,
  FIRSTOF,
  ROUTINE,
  HOLIDAY,
  OTHER,
  INVALID
}

enum DateTypes {
  LUNAR,
  SOLAR,
  INVALID
}

Map<SpecialDays, String> EventMap = {
  SpecialDays.BIRTHDAY: "Birthday",
  SpecialDays.ANNIVERSARY: "Anniversary",
  SpecialDays.FIRSTOF: "First of...",
  SpecialDays.ROUTINE: "Repeating",
  SpecialDays.HOLIDAY: "Holiday",
  SpecialDays.OTHER: "Other",
  SpecialDays.NOTHING: "Reminder",
  SpecialDays.INVALID: "??? (Opps, we have an error here)",
};

Map<SpecialDays, String> EventIcon = {
  SpecialDays.BIRTHDAY: "🍰",
  SpecialDays.ANNIVERSARY: "💌",
  SpecialDays.FIRSTOF: "📅",
  SpecialDays.ROUTINE: "🔁",
  SpecialDays.HOLIDAY: "🧨",
  SpecialDays.OTHER: "🎁",
  SpecialDays.NOTHING: "🎀",
  SpecialDays.INVALID: "🛑",
};

List<singleEvent> constantSpecialDayStrings = [
  singleEvent(SpecialDays.BIRTHDAY),
  singleEvent(SpecialDays.ANNIVERSARY),
  singleEvent(SpecialDays.FIRSTOF),
  singleEvent(SpecialDays.ROUTINE),
  singleEvent(SpecialDays.HOLIDAY),
  singleEvent(SpecialDays.OTHER),
  singleEvent(SpecialDays.NOTHING),
];
