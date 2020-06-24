import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorGradient extends StatelessWidget {
  final Widget child;
  final Color colorA;
  final Color colorB;

  ColorGradient({this.child, this.colorA = Colors.lightBlue, this.colorB = Colors.red});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [this.colorA, this.colorB],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}