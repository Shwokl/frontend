import 'package:flutter/material.dart';

class RoleIcon extends StatelessWidget {
  final int roleId;
  const RoleIcon(this.roleId);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;

    switch (roleId) {
      case 1: // admin
        icon = Icons.verified_sharp;
        color = Colors.green;
        break;

      case 2: // user
        icon = Icons.verified_user;
        color = Colors.green;
        break;

      case 3: // guest
        icon = Icons.warning;
        color = Colors.red;
        break;
    }

    return Icon(
      icon,
      color: color,
      size: 24,
    );
  }
}
