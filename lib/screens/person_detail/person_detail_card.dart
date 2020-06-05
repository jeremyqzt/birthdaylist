import 'package:flutter/material.dart';
import './date_detail.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';


//Code Stolen From https://stackoverflow.com/questions/60338584/flutter-how-allow-content-to-overlap-sliverappbar

class PersonDetailCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonDetailCard();
}

class _PersonDetailCard extends State<PersonDetailCard>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> headerNegativeOffset = ValueNotifier<double>(0);
  final ValueNotifier<bool> appbarShadow = ValueNotifier<bool>(false);

  final double maxHeaderHeight = 256.0;
  final double minHeaderHeight = 55.0;
  final double bodyContentRatioMin = .8;
  final double bodyContentRatioMax = 1.0;
  final Color themeColor = Colors.blueGrey;

  ///must be between min and max values of body content ratio.
  final double bodyContentRatioParallax = .9;

  @override
  void dispose() {
    headerNegativeOffset.dispose();
    appbarShadow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //just for status bar color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: themeColor,
          elevation: 0.0,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Stack(children: [
            Container(
                child: ValueListenableBuilder<double>(
                    valueListenable: headerNegativeOffset,
                    builder: (context, offset, child) {
                      return Transform.translate(
                        offset: Offset(0, offset * -1),
                        child: SizedBox(
                          height: maxHeaderHeight,
                          child: Container(
                            color: themeColor,
                          ),
                        ),
                      );
                    })),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                if (notification.extent == bodyContentRatioMin) {
                  appbarShadow.value = false;
                  headerNegativeOffset.value = 0;
                } else if (notification.extent == bodyContentRatioMax) {
                  appbarShadow.value = true;
                  headerNegativeOffset.value =
                      maxHeaderHeight - minHeaderHeight;
                } else {
                  double newValue = (maxHeaderHeight - minHeaderHeight) -
                      ((maxHeaderHeight - minHeaderHeight) *
                          ((bodyContentRatioParallax - (notification.extent)) /
                              (bodyContentRatioMax -
                                  bodyContentRatioParallax)));
                  appbarShadow.value = false;
                  if (newValue >= maxHeaderHeight - minHeaderHeight) {
                    appbarShadow.value = true;
                    newValue = maxHeaderHeight - minHeaderHeight;
                  } else if (newValue < 0) {
                    appbarShadow.value = false;
                    newValue = 0;
                  }
                  headerNegativeOffset.value = newValue;
                }

                return true;
              },
              child: Stack(
                children: <Widget>[
                  DraggableScrollableSheet(
                    initialChildSize: bodyContentRatioMin,
                    minChildSize: bodyContentRatioMin,
                    maxChildSize: bodyContentRatioMax,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 10.0),
                            child: Material(
                              type: MaterialType.canvas,
                              color: Colors.white,
                              elevation: 2.0,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              ),
                              child: Container(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int index) {
                                    return DateDetail(LineAwesomeIcons.heart);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ]),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: ValueListenableBuilder<bool>(
                valueListenable: appbarShadow,
                builder: (context, value, child) {
                  return AppBar(
                    backgroundColor: themeColor,
                    title: Text("Jeremy Q."),
                    elevation: value ? 2.0 : 0.0,
                  );
                }),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}