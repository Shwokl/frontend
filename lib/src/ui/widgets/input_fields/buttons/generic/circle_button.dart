import 'dart:math';

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color fillColor;
  final Color accentColor;
  final VoidCallback onPressed;
  final double scale;

  const CircleButton({
    @required this.icon,
    @required this.onPressed,
    this.fillColor,
    this.accentColor,
    this.scale = 1,
    this.iconSize = 36.0,
  });

  @override
  Widget build(BuildContext context) {
    const double minIconSize = 24;
    const double minPadding = 12;

    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(max(minPadding, 16.0 * scale)),
      fillColor: fillColor ?? Theme.of(context).primaryColor,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: max(minIconSize, iconSize * scale),
        color: accentColor ?? Theme.of(context).accentColor,
      ),
    );
  }
}
