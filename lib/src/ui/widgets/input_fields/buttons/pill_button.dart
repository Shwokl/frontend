import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final VoidCallback onPressed;

  const PillButton({
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      colorBrightness: Brightness.light,
      padding: padding,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
