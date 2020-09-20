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
                  getAppBar("♏ Jeremy Qian"),
                ];
              },
              body: Center(
                child: Text("Sample text"),
              ),
            ),
          );
    }

    Widget getAppBar(String headerText) {
        return
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: Icon(Icons.arrow_back),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  headerText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.asset(
                  "assets/images/stars.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
    }
}

