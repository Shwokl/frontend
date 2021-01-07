// External imports
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;

// Local imports
import '../../api/generic_auth_api.dart';
import '../../models/credentials.dart';
import '../../models/token.dart';
import '../../services/registration/generic_registration_service.dart';

/// A registration service that accepts an `(email, password)` pair.
class EmailRegistrationService implements GenericRegistrationService {
  final GenericAuthApi _api; // The api to which we 'forward' requests

  // Constructor
  const EmailRegistrationService(this._api);

  /// Bundles up an [email], [password], [name] and [username] into a Credentials object
  /// with the `AuthMethod` of `AuthMethod.email`
  @override
  Credentials buildCredentials({
    String username = "",
    String name = "",
    @required String email,
    @required String password,
  }) {
    return Credentials(
      method: AuthMethod.email,
      name: name,
      username: username,
      password: password,
      email: email,
    );
  }

  /// Attempt to create a user with the given [credentials].
  ///
  /// If the credentials are valid, a [token] is returned from the server.
  /// You can use that token to further authorize any subsequent action.
  /// If something went wrong, an error is returned.
  @override
  Future<Result<Token>> signUp(final Credentials credentials) async {
    // Ensure proper credentials have been passed
    assert(credentials != null && credentials.method == AuthMethod.email);

    // Send the actual api request
    final Result<String> result = await _api.singUp(credentials);

    // Parse the response
    if (result.isError) {
      return result.asError;
    } else {
      return Result.value(Token(value: result.asValue.value));
    }
  }
}
