import 'package:flutter/material.dart';
import 'screens/person_detail/person_detail.dart';
import 'screens/person_detail/person_detail_card.dart';
import "utils/im_db.dart";
import "utils/file_util.dart";
import 'screens/date_detail/date_detail.dart';
import 'style.dart';

void main() async{
  runApp(App());
}

class App extends StatelessWidget {
  imDb inMemDb;

  App(){
    WidgetsFlutterBinding.ensureInitialized();
    this.inMemDb = new imDb();
    this.initializeData();
  }

  initializeData() async{
    await this.inMemDb.readDisk();
    //print(this.inMemDb["savedEntries"]);
  }

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