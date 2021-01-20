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
    this.iconSize = 36,
    this.fontSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final ThemeData theme = Theme.of(context);
    const double minIconSize = 24;
    const double minFontSize = 18;
    const double minVPadding = 8;
    const double minHPadding = 36;

    final double iSize = iconSize * scale;
    final double fSize = fontSize * scale;

    if (leadingIcon != null) {
      children.add(Icon(
        leadingIcon,
        size: max(iSize, minIconSize),
        color: textColor ?? theme.primaryColor,
      ));
      children.add(const SizedBox(width: 8.0));
    }
    children.add(Text(
      text,
      style: TextStyle(
        color: textColor ?? theme.primaryColor,
        fontSize: max(fSize, minFontSize),
        letterSpacing: 1.2,
        fontWeight: FontWeight.w800,
      ),
    ));

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(
          max(minHPadding, padding.left),
          max(minVPadding, padding.top),
          max(minHPadding, padding.right),
          max(minVPadding, padding.bottom),
        ),
        primary: fillColor ?? theme.accentColor,
        shadowColor: Colors.black,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0 * scale),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
