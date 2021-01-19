// External imports
import 'package:flutter/foundation.dart' show required;

/// A list of all the services available for authentication.
///
/// For now, we just use email based auth via checking against the database,
/// but 3rd party services could be added, such as google, github or facebook
enum AuthMethod {
  username,
}

/// A wrapper around the data required to perform authentication tasks.
///
/// The [method] field represents the service chosen by the user to perform the
/// given authentication task.
/// As an absolute bare minimum, only the [method] and [email] fields are needed,
/// as 3rd party auth services (such as google) don't require anything more than
/// an email to complete the task.
/// That being said, the `ShwoklAuthenticationService` does require a [username]
/// as well, but the responsibility of making that field required is restricted
/// to the class itself, as this only implments a common denominator among all
/// authentication methods.
///
///* Any other service of authentication that is implemented will be responsible
///* of enforcing any other field as `@required` on it's own, besides the [method]
///* and the [email]!
class Credentials {
  final AuthMethod method;
  final String name;
  final String username;
  final String email;
  final String password;

  // Constructor
  Credentials({
    @required this.method,
    @required this.email,
    this.username = "",
    this.password = "",
    this.name = "",
  });

  /// Convert the current object to a Map<String, dynamic> for embedding it in http requests
  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
