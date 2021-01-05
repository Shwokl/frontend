import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

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
