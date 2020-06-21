import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

enum SpecialDays {
  NOTHING,
  BIRTHDAY,
  ANNIVERSARY,
  FIRSTOF,
  ROUTINE,
  OTHER,
  INVALID
}

class supportedDateUtil{

  static IconData getIconFromDay(int idx){
    IconData ret;
    switch (SpecialDays.values[idx]){
      case SpecialDays.BIRTHDAY:
        ret = LineAwesomeIcons.birthday_cake;
        break;
      case SpecialDays.ANNIVERSARY:
        ret = LineAwesomeIcons.heart;
        break;
      case SpecialDays.FIRSTOF:
        ret = Icons.looks_one;
        break;
      case SpecialDays.ROUTINE:
        ret = Icons.assignment_turned_in;
        break;
      case SpecialDays.NOTHING:
      case SpecialDays.OTHER:
      case SpecialDays.INVALID:
        ret = Icons.all_inclusive;
        break;
    }

    return ret;
  }
}