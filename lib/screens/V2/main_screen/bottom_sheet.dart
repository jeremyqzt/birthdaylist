import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheet createState() => _BottomSheet();
}

class _BottomSheet extends State<BottomSheet> {
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