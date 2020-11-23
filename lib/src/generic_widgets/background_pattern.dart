import 'package:flutter/material.dart';

class BackgroundPattern extends StatelessWidget {
  final double opacity;
  const BackgroundPattern({@required this.opacity});

  @override
  Widget build(BuildContext context) {
    String _pattern = "lib/src/assets/pattern/";
    if (Theme.of(context).brightness == Brightness.dark) {
      _pattern += "dark.png";
    } else {
      _pattern += "light.png";
    }

    return Opacity(
      opacity: opacity,
      child: Image.asset(
        _pattern,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
