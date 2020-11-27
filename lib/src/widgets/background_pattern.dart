import 'package:flutter/material.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern();

  @override
  Widget build(BuildContext context) {
    String _pattern = "lib/src/assets/pattern/";
    if (Theme.of(context).brightness == Brightness.dark) {
      _pattern += "dark.png";
    } else {
      _pattern += "light.png";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Opacity(
        opacity: 0.4,
        child: Image.asset(
          _pattern,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
