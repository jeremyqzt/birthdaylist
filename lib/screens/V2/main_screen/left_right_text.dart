import 'package:flutter/material.dart';

class LeftRightText extends StatelessWidget {
  final String left;
  final String right;
  LeftRightText(this.left, this.right);

  @override
  Widget build(BuildContext context) {
    double leftRightPad = 10;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: leftRightPad),
            child:Text("${this.left}", style: TextStyle(fontSize: 16.0),),
          ),
          Padding(
            padding: EdgeInsets.only(right: leftRightPad),
            child:Text("${this.right}", style: TextStyle(fontSize: 13.0),),
          ),
        ]
    );
  }
}
