import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shwokl | Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Welcome to your dashboard"),
      ),
    );
  }
}
