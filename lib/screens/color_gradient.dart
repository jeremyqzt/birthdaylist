import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorGradient extends StatelessWidget {
  final Widget child;

  ColorGradient({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.lightBlue, Colors.red],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}