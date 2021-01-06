import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final VoidCallback onPressed;
  final Color fillColor, textColor;
  final IconData leadingIcon;
  final double iconSize;
  final double fontSize;

  const PillButton({
    @required this.text,
    @required this.onPressed,
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

    if (leadingIcon != null) {
      children.add(Icon(
        leadingIcon,
        size: iconSize,
        color: textColor ?? Theme.of(context).primaryColor,
      ));
      children.add(const SizedBox(width: 8.0));
    }
    children.add(Text(
      text,
      style: TextStyle(
        color: textColor ?? Theme.of(context).primaryColor,
        fontSize: fontSize,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w800,
      ),
    ));

    return RaisedButton(
      colorBrightness: Brightness.light,
      padding: padding,
      color: fillColor ?? Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
