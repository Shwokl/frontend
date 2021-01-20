// External imports
import 'package:flutter/material.dart';
import 'package:frontend/src/data/shwokl/roles/role.dart';

// Local imports
import '../../../data/shwokl/users/user.dart';
import 'views/web_view.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return WebView(
      user: User(
          id: 1,
          avatar:
              'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2130&q=80',
          username: 'mike',
          password: 'password',
          spice: 'spice',
          role: Role(id: 2, name: 'User'),
          name: 'Michael Anthony'),
    );
  }
}
