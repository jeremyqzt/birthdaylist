import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  //MainHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 0.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Image.network("https://source.unsplash.com/uo7kcpljIxg",
      fit: BoxFit.cover,
      )
    );
  }
}