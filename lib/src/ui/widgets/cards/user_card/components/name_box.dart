import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  final String name;
  const NameBox(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 24,
        letterSpacing: 1.2,
      ),
    );
  }
}
