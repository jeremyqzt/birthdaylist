import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './bottom_sheet_card.dart';

class ActionBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // this is ignored if animatedIcon is non null
      // child: Icon(Icons.add),
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(AntDesign.adduser),
            backgroundColor: Colors.indigoAccent,
            label: 'Create New Contact',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {
              showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                  builder: (BuildContext buildContext){
                    return Container(
                        padding:
                        EdgeInsets.only(bottom: MediaQuery
                            .of(context)
                            .viewInsets
                            .bottom),
                        child: BottomSheetCard()
                    );
                  }
              )
            }
        ),
        SpeedDialChild(
          child: Icon(MaterialIcons.import_contacts),
          backgroundColor: Colors.green,
          label: 'Importing a Existing Contact',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('SECOND CHILD'),
        ),
      ],
    );
  }

}
