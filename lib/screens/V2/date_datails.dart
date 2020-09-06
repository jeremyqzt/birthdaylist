import 'package:flutter/material.dart';
import './clipper.dart';
import './date_detail_from.dart';

class DatePicker extends StatefulWidget {
  DatePicker();
  @override
  State<StatefulWidget> createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                      children: [
                        ClipPath(
                          child: Image.network(
                              "https://source.unsplash.com/0x6RTts1jRU",
                              fit: BoxFit.cover
                          ),
                          clipper: BottomWaveClipper(),
                        ),
                        SafeArea(
                          left: true,
                          top: true,
                          right: true,
                          bottom: true,
                          minimum: const EdgeInsets.all(16.0),
                          child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                            radius: 22,
                                            backgroundColor: Colors
                                                .orangeAccent,
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.black,
                                              child: Text('JQ'),
                                            )
                                        )
                                    )
                                ),
                              ]
                          ),
                        ),
                      ]
                  ),
                  TestForm()
                ]
            )
        )
    );
  }
}
