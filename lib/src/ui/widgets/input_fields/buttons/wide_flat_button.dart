import 'package:flutter/material.dart';

class WideFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final String text;

  const WideFlatButton({
    @required this.text,
    @required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 80.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 18,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
