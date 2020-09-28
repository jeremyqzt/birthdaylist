import 'package:flutter/material.dart';
import 'screens/person_detail/person_detail.dart';
import 'screens/person_detail/person_detail_card.dart';
import "utils/im_db.dart";
import "utils/file_util.dart";
import 'screens/date_detail/date_detail.dart';
import 'screens/V2/date_datails.dart';
import 'screens/V2/main_screen/contact_list.dart';
import 'screens/V2/expanded_contact.dart';

import 'style.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  imDb inMemDb = new imDb();
  await inMemDb.readDisk();
  runApp(App(inMemDb));
}

class App extends StatelessWidget {
  imDb inMemDb;
  App(imDb db){
    this.inMemDb = db;
  }

  @override
  Widget build(BuildContext context) {
    this.inMemDb.getMostRecent();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/second': (context) => ExpandedContact(),
        '/': (context) => ContactList(this.inMemDb),
      },
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