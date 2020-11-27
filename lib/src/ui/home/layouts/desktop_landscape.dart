import 'package:flutter/material.dart';

class LandscapeDesktopLayout extends StatelessWidget {
  const LandscapeDesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Standard layout',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
