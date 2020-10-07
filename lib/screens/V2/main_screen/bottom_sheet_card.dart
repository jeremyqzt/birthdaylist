import 'package:flutter/material.dart';

class BottomSheetCard extends StatefulWidget {
  @override
  _BottomSheetCard createState() => _BottomSheetCard();
}

class _BottomSheetCard extends State<BottomSheetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(10.0),
        topRight: const Radius.circular(10.0))
      ),
      child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: []
        ),
      )
    );
  }
}