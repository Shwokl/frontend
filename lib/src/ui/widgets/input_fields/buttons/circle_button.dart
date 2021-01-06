import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color fillColor;
  final Color accentColor;
  final VoidCallback onPressed;

  const CircleButton({
    @required this.icon,
    @required this.onPressed,
    this.iconSize = 24.0,
    this.fillColor,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(16.0),
      fillColor: fillColor ?? Theme.of(context).primaryColor,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: iconSize,
        color: accentColor ?? Theme.of(context).accentColor,
      ),
    );
  }
}
