// External imports
import 'package:flutter/foundation.dart' show required;

enum AuthMethod {
  email,
}

class Credentials {
  final AuthMethod method;
  final String name;
  final String username;
  final String email;
  final String password;

  Credentials({
    @required this.method,
    @required this.email,
    this.username,
    this.password,
    this.name,
  });
}
