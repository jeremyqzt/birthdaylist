import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ExpandedContact extends StatefulWidget {
  ExpandedContact();

  @override
  State<StatefulWidget> createState() {
    return _ExpandedContact();
  }
}

class _ExpandedContact extends State<ExpandedContact> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Color(0xff3a3637),
          title: Text("Jeremy Qian"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 21.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("assets/images/confetti.gif"),
                ),
              ),
            )
          ],
        ),
          body: ListView(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:Text("All  Events", style: TextStyle(fontSize: 22.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: FlatButton(
                        textColor: Colors.blueAccent,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Create New",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )
                    ),
                  ]
              ),
              ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Three-line ListTile'),
                subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                ),
                trailing: Icon(Icons.delete),
                isThreeLine: true,
              ),
              ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Three-line ListTile'),
                subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                ),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Three-line ListTile'),
                subtitle: Text(
                    'A sufficiently long subtitle warrants three lines.'
                ),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ],
          )
      );
    }
}

