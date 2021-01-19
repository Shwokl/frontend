// External imports
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;

// Local imports
import '../../api/auth_api_interface.dart';
import '../../services/authentication_service_interface.dart';
import '../models/credentials.dart';
import '../models/token.dart';

/// An authentication service that validate as `(username, password)` pair.
class UsernameAuthenticationService implements IAuthSenticationervice {
  final IAuthApi _api; // the api to which we 'forward' the calls

  // Constructor
  const UsernameAuthenticationService(this._api);

  /// Bundles up an [email], [password], [name] and [username] into a Credentials object
  /// with the `AuthMethod` of `AuthMethod.email`.
  @override
  Credentials buildCredentials({
    @required String username,
    String name = "",
    String email = "",
    @required String password,
  }) {
    return Credentials(
      method: AuthMethod.username,
      name: name,
      username: username,
      password: password,
      email: email,
    );
  }

  /// Send the given [credetials] to the API server for validation.
  ///
  /// If the given credentials are valid, the API server should return a [token]
  /// that you can use to further authorize actions.
  /// If the credentials are wrong, a [Response.error] is returned.
  @override
  Future<Result<Token>> signIn(final Credentials credentials) async {
    // Ensure proper credentials have been passed.
    assert(credentials != null);

    // Send the actual api request.
    final Result<String> result = await _api.singIn(credentials);

    // Parse the response
    if (result.isError) {
      return result.asError;
    } else {
      return Result.value(Token(value: result.asValue.value));
    }
  }

  /// Sends the current [token] to the api server for invalidation.
  ///
  /// If the server successfuly disposed of our token, a value of `true` is
  /// returned
  @override
  Future<Result<bool>> signOut(Token token) async {
    // Ensure the given token is valid
    assert(token != null && token.value.isNotEmpty);

    // Send the actual api request
    return _api.signOut(token);
  }
}
