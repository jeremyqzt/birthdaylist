import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  //MainHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Image.network("https://source.unsplash.com/Xaanw0s0pMk",
                fit: BoxFit.cover
            ),
            Center(
                child: Text(
                  "Jeremy Qian",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                      ],
                  )
                )
            ),
          ]
      )
    );
  }
}