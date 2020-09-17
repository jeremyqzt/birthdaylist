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
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 200.0,
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
                  SliverPadding(
                    padding: new EdgeInsets.all(16.0),
                    sliver: new SliverList(
                      delegate: new SliverChildListDelegate([
                        TabBar(
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                            new Tab(
                                icon: new Icon(Icons.lightbulb_outline),
                                text: "Tab 2"),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ];
              },
              body: Center(
                child: Text("Sample text"),
              ),
            ),
          ));
    }
}