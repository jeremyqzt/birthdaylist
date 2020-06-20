import 'package:flutter/material.dart';
import 'screens/person_detail/person_detail.dart';
import 'screens/person_detail/person_detail_card.dart';
import "utils/im_db.dart";
import "utils/file_util.dart";
import 'screens/date_detail/date_detail.dart';
import 'style.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  imDb inMemDb = new imDb();
  await inMemDb.readDisk();
  print(inMemDb["savedEntries"]);
  runApp(App(inMemDb));
}

class App extends StatelessWidget {
  imDb inMemDb;
  App(db){
    this.inMemDb = db;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:PersonDetailCard(this.inMemDb), // PersonDetail(),
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