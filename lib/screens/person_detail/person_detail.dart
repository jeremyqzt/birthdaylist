import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main_header.dart';
import './date_detail.dart';

class PersonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeremy Q.'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainHeader(),
          DateDetail(),
          DateDetail(),
       ],
      )
    );
  }
}
