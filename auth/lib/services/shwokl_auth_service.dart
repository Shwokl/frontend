// External imports
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;

// Local imports
import '../api/generic_auth_api.dart';
import '../models/credentials.dart';
import '../models/token.dart';
import '../services/generic_authentication_service.dart';
import '../services/generic_signup_service.dart';

class ShwoklAuthService implements GenericAuthService, GenericSignupService {
  final GenericAuthApi _api;

  const ShwoklAuthService(this._api);

  @override
  Future<Result<Token>> signIn(final Credentials credentials) async {
    assert(credentials != null);

    final Result<String> result = await _api.singIn(credentials);

    if (result.isError) {
      return result.asError;
    } else {
      return Result.value(Token(value: result.asValue.value));
    }
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    assert(token != null && token.value.isNotEmpty);
    return _api.signOut(token);
  }

  @override
  Future<Result<Token>> signup({
    final String name = "",
    @required final String username,
    @required final String password,
    @required final String email,
  }) async {
    assert(username.isNotEmpty && username != null);
    assert(password.isNotEmpty && password != null);
    assert(email.isNotEmpty && email != null);

    final Credentials credentials = Credentials(
      method: AuthMethod.email,
      email: email,
      name: name,
      username: username,
      password: password,
    );

    final Result<String> result = await _api.singUp(credentials);

    if (result.isError) {
      return result.asError;
    } else {
      return Result.value(Token(value: result.asValue.value));
    }
  }
}
