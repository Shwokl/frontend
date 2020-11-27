import 'package:flutter/material.dart';

class LandscapeMobileLayout extends StatelessWidget {
  const LandscapeMobileLayout();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Mobile landscape',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
