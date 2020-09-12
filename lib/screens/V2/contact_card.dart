import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactCard extends StatefulWidget {
  ContactCard();

  @override
  State<StatefulWidget> createState() {
    return _ContactCard();
  }
}

class _ContactCard extends State<ContactCard> {
  Widget get contactCardIndividual {
    return
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
          color: Colors.white,
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 4.5,
                child: Opacity(
                  opacity: 0.25,
                  child:Image.network(
                    "https://media.giphy.com/media/3ohhwznSVuwXu6RnEY/giphy.gif",
                    fit: BoxFit.fitWidth,
                ),
              ),),
              Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                    ListTile(
                      subtitle:
                      Row(
                        mainAxisSize:  MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                              'Birthday in 2 days'
                          ),
                        ]
                      ),
                      trailing: Icon(Ionicons.ios_arrow_forward),
                      title: Text('Jeremy Qian'),
                      leading: CircleAvatar(
                        radius: 18.0,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 17.0,
                          backgroundColor: Colors.green,
                          child: Text('JQ'),
                        ),
                      ),
                    ),
                  ]
              ),
            ]
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top:3),
      child:  contactCardIndividual,
    );
  }
}