import 'dart:math';

import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final double scale;
  const AppbarTitle({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    const double minFontSize = 32;
    final double fontSize = 48 * scale;

    return Text(
      'Shwokl',
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: max(minFontSize, fontSize),
        letterSpacing: 3.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
