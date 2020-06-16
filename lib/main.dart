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

  App(){
    WidgetsFlutterBinding.ensureInitialized();
    this.readContents();
  }

  readContents() async{
    String assetFile = await FileUtil.getAssetFile("assets/config/testData.json");
    imDb.convertToJson(assetFile);
    //FileUtil.writeFile('{"Jeremy": True}');
    //String t;
    //t = await FileUtil.readFile();
    //print(t);
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