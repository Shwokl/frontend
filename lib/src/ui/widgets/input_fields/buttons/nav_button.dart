import 'package:flutter/material.dart';

import 'wide_flat_button.dart';

class NavButton extends StatelessWidget {
  final String text;
  final bool accent;
  final VoidCallback onPressed;

  const NavButton({
    @required this.text,
    @required this.onPressed,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    return WideFlatButton(
      text: text,
      color: accent
          ? Theme.of(context).accentColor
          : Theme.of(context).primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      onPressed: onPressed,
    );
  }
}
