// External imports
import 'package:flutter/material.dart';

// Local imports
import '../../../../data/shwokl/users/user.dart';
import 'components/all.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          width: 500,
          height: 150,
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
        ));
  }
}
