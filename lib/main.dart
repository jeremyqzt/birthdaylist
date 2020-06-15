import 'package:flutter/material.dart';
import 'screens/person_detail/person_detail.dart';
import 'screens/person_detail/person_detail_card.dart';
import "utils/im_db.dart";
import "utils/file_util.dart";

import 'screens/date_detail/date_detail.dart';
import 'style.dart';

void main() async{
  runApp(App());
  //imDb test = new imDb();
  FileUtil.writeFile('{"Jeremy": True}');
  String t;
  t = await FileUtil.readFile();
  print(t);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:PersonDetailCard(), // PersonDetail(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle)
        ),
        textTheme: TextTheme(
            headline6: TitleTextStyle,
            bodyText2: Body1TextStyle,
          )
        ),
    );
  }
}