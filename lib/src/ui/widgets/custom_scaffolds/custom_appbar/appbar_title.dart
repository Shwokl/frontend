import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Shwokl",
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 32,
        letterSpacing: 3.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
