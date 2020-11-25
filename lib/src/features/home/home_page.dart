import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shwokl | Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Welcome to your dashboard"),
      ),
    );
  }
}
