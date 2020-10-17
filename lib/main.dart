import 'package:flutter/material.dart';
import "utils/im_db.dart";
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
    this.inMemDb.enumeratePersons();
    this.inMemDb.getMostRecentEventBetweenAllContacts();
    this.inMemDb.addContact();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/second': (context) => ExpandedContact(),
        '/': (context) => ContactList(this.inMemDb),
      },
      theme: ThemeData(
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.grey[50],
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