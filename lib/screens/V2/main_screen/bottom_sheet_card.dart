import 'package:flutter/material.dart';
import './bottom_card_form.dart';

class BottomSheetCard extends StatefulWidget {
  @override
  _BottomSheetCard createState() => _BottomSheetCard();
}

class _BottomSheetCard extends State<BottomSheetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
          child: Container(
              height: 465,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child:Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: BottomCardForm(),
                  )
                ]
            ),
        )
      )
    );
  }
}