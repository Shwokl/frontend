import 'dart:math';

import 'package:flutter/material.dart';

class WideFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final String text;
  final Color color;
  final double scale;

  const WideFlatButton({
    @required this.text,
    @required this.onPressed,
    @required this.scale,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 80.0,
    ),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    const double minFontSize = 18;
    const Size minSize = Size(32, 8);
    final double fontSize = 26 * scale;
    print('FontSize: $fontSize');
    print("mid scale: $scale <-----------");
    print('Actual font size: ${max(minFontSize, fontSize)}');

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.fromLTRB(
          max(minSize.width, padding.left),
          max(minSize.height, padding.top),
          max(minSize.width, padding.right),
          max(minSize.height, padding.bottom),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Theme.of(context).accentColor,
          fontSize: max(minFontSize, fontSize),
          letterSpacing: 1.2,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
