import 'package:flutter/material.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern();

  @override
  Widget build(BuildContext context) {
    String _pattern = "lib/src/assets/patterns/memphis-mini";
    if (Theme.of(context).brightness == Brightness.dark) {
      _pattern += "dark.png";
    } else {
      _pattern += "light.png";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Image.asset(
        _pattern,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}
