import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String username;
  const UserAvatar(this.username);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(username),
      radius: 48,
    );
  }
}
