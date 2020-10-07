import 'package:flutter/material.dart';

class BottomSheetCard extends StatefulWidget {
  @override
  _BottomSheetCard createState() => _BottomSheetCard();
}

class _BottomSheetCard extends State<BottomSheetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 250,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: []
      ),
    );
  }
}