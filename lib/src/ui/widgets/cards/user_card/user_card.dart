// External imports
import 'dart:math';
import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/users/user.dart';
import 'components/all.dart';

class UserCard extends StatelessWidget {
  final User user;
  final double scale;
  const UserCard(
    this.user, {
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    const double minWidth = 425;
    const double referenceWidth = 500;
    const double referenceHeight = 150;

    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: max(16 * scale, 8),
          horizontal: max(24 * scale, 8),
        ),
        width: max(minWidth, referenceWidth * scale),
        height: referenceHeight,
        child: Row(
          children: [
            UserAvatar(user.avatar),
            const SizedBox(width: 24.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    NameBox(user.name),
                    const SizedBox(width: 8.0),
                    RoleIcon(user.role.id),
                  ],
                ),
                UsernameBox(user.username),
              ],
            )
          ],
        ),
      ),
    );
  }
}
