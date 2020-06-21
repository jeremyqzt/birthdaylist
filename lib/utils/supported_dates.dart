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

  static List<int> getNextOccur(DateTime curTime, DateTime thisYearOccur, DateTime firstOcc){
    int DateDifference = thisYearOccur.difference(curTime).inDays;
    int yearDiff = thisYearOccur.year - firstOcc.year;
    if (DateDifference == 0){ //Is Today
      return [DateDifference, yearDiff];
    }

    if (curTime.isBefore(thisYearOccur)){ //Didnt get to yet
      print(thisYearOccur.difference(curTime).inDays);
      return  [DateDifference + 1, yearDiff];
    } else {
      yearDiff += 1;
      return [DateTime(thisYearOccur.year + 1, thisYearOccur.month, thisYearOccur.day).difference(curTime).inDays, yearDiff];
    }
  }

  static List<String> buildMsgFromDate(String storedDateTime, int dateType){
    String msg = "Houston, We've got a problem!";
    String subMsg = "This is Houston. Say again, please.";
    DateTime cur = DateTime.now();
    DateTime curDate = new DateTime(cur.year, cur.month, cur.day);
    DateTime parsedDate = DateTime.parse(storedDateTime);
    DateTime thisYearOccur = DateTime(cur.year, parsedDate.month, parsedDate.day);

    List<int> TotalDiff = getNextOccur(curDate, thisYearOccur, parsedDate);
    int dayDiff = TotalDiff[0];
    int yearDiff = TotalDiff[1];

    switch (SpecialDays.values[dateType]){
      case SpecialDays.BIRTHDAY:
        msg = "Turning ${yearDiff}";
        subMsg = "${dayDiff} Days Until Birthday";
        break;
      case SpecialDays.ANNIVERSARY:
        msg = "${yearDiff} Aniversary";
        subMsg = "${dayDiff} Days to the Aniversary.";
        break;
      case SpecialDays.FIRSTOF:
        msg = "${yearDiff} Times Around";
        subMsg = "${dayDiff} More Days!";
        break;
      case SpecialDays.ROUTINE:
        msg = "${yearDiff} Times Around";
        subMsg = "${dayDiff} More Days";
        break;
      case SpecialDays.NOTHING:
      case SpecialDays.OTHER:
      case SpecialDays.INVALID:
        msg = "${yearDiff} Times Around";
        subMsg = "${dayDiff} More Days";
        break;
    }

    subMsg = (dayDiff == 0) ? "Today's The Day!" : subMsg;

    return [msg, subMsg];
  }

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
      case SpecialDays.NOTHING: //Best fall through
      case SpecialDays.OTHER:
      case SpecialDays.INVALID:
        ret = Icons.all_inclusive;
        break;
    }

    return ret;
  }
}