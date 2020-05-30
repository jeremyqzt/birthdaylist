import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../color_gradient.dart';

class DateDetail extends StatelessWidget {
  //DateDetail();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Container(
          width: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(1.0),
             child: Column(
              children: <Widget>[
                ListTile(
                  leading:
                    ColorGradient(
                      child: Icon(
                        Icons.cake,
                        size: 50,
                        color: Colors.white,
                      )
                    ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
                    child:Text(
                    '26th Birthday',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.fromLTRB(0, 1.0, 0, 10.0),
                    child: Text(
                    '104 Days Until Birthday',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ]
    );
  }
}