import 'package:flutter/material.dart';
import "../../../utils/im_db.dart";
import 'action_button.dart';
import 'others.dart';
import 'top_item.dart';

class ContactList extends StatefulWidget {
  imDb db;

  ContactList(imDb db){
    this.db = db;
  }
  @override
  State<StatefulWidget> createState() => _ContactList(this.db);
}

class _ContactList extends State<ContactList> {
  imDb db;
  _ContactList(imDb db){
    this.db = db;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 185,
              ),
            ),
            SliverFillRemaining(
              child: OthersList(this.db),
            ),
          ],
        ),
      ),
      floatingActionButton: ActionBtn(),
    );
  }
}