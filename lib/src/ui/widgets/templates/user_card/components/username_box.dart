import 'package:flutter/material.dart';

class UsernameBox extends StatelessWidget {
  final String username;
  const UsernameBox(this.username);

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.grey,
      ),
    );
  }
}
