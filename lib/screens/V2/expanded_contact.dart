import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ExpandedContact extends StatefulWidget {
  ExpandedContact();

  @override
  State<StatefulWidget> createState() {
    return _ExpandedContact();
  }
}

class _ExpandedContact extends State<ExpandedContact> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 150.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image.asset(
                              "assets/images/stars.jpg",
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ),
                ];
              },
              body: Center(
                child: Text("Sample text"),
              ),
            ),
          );
    }
}