import 'package:flutter/material.dart';

class PortraitDesktopLayout extends StatelessWidget {
  const PortraitDesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Tall layout',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
