import 'dart:math';

import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final VoidCallback onPressed;
  final Color fillColor, textColor;
  final IconData leadingIcon;
  final double iconSize;
  final double fontSize;
  final double scale;

  const PillButton({
    @required this.text,
    @required this.onPressed,
    this.scale = 1,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
    this.fillColor,
    this.textColor,
    this.leadingIcon,
    this.iconSize = 24,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    const double minIconSize = 16;
    const double minFontSize = 14;
    const Size minSize = Size(48, 16);
    final double iSize = iconSize * scale;
    final double fSize = fontSize * scale;

    if (leadingIcon != null) {
      children.add(Icon(
        leadingIcon,
        size: max(iSize, minIconSize),
        color: textColor ?? Theme.of(context).primaryColor,
      ));
      children.add(const SizedBox(width: 8.0));
    }
    children.add(Text(
      text,
      style: TextStyle(
        color: textColor ?? Theme.of(context).primaryColor,
        fontSize: max(fSize, minFontSize),
        letterSpacing: 1.2,
        fontWeight: FontWeight.w800,
      ),
    ));

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(
          max(minSize.width, padding.left),
          max(minSize.height, padding.top),
          max(minSize.width, padding.right),
          max(minSize.height, padding.bottom),
        ),
        primary: fillColor ?? Theme.of(context).accentColor,
        shadowColor: Colors.black,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0 * scale),
        ),
      ),
      // colorBrightness: Brightness.light,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
