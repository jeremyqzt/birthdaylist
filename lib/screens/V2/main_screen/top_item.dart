import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;


  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  String getPicture(){
   return  "assets/images/confetti.gif";
  }

  String getEventText(){
    return "Melody's Birthday 🎉";
  }

  List<String> getEventContext(){

  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.lightBlue,

              elevation: 0.0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Opacity(
                      opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                      child:Icon(Icons.settings)
                  ),
                )
              ],
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("All Contacts")),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 * percent),
                child: Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        elevation: 10.0,
                        color: Colors.white,
                        child: Column(
                            children: <Widget> [
                              SizedBox(height: 35),
                              Center(
                                child: Text(
                                  this.getEventText(),
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text("Melody's 25th Birthday is coming up in 5 days!"),
                              ),
                              Divider(
                                color: Colors.blueGrey,
                                indent: 15,
                                endIndent: 15,
                              ),
                              Expanded(
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child:Column(
                                            children: <Widget> [
                                              SizedBox(height: 10),
                                              Icon(Ionicons.ios_moon),
                                              SizedBox(height: 10),
                                              Text(
                                                "Lunar: May-1st",
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                      VerticalDivider (
                                        endIndent: 7,
                                        color: Colors.blueGrey,
                                      ),
                                      Expanded(
                                        child:Column(
                                            children: <Widget> [
                                              SizedBox(height: 10),
                                              Icon(MaterialCommunityIcons.zodiac_scorpio),
                                              SizedBox(height: 10),
                                              Text(
                                                "Zodiac: Scirpio",
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ]
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0.0, -0.4),
                        child: Align(
                          child: CircleAvatar(
                            radius: 45.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: AssetImage(this.getPicture()),
                            ),
                          ),
                          alignment: FractionalOffset(0.5, (cardTopPosition - 45)/185),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}