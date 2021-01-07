// External imports
import 'package:flutter/foundation.dart' show required;
import 'package:async/async.dart' show Result;

// Local imports
import '../../api/generic_auth_api.dart';
import '../../models/credentials.dart';
import '../../models/token.dart';
import '../../services/registration/generic_registration_service.dart';

class EmailRegistrationService implements GenericRegistrationService {
  final GenericAuthApi _api;
  const EmailRegistrationService(this._api);

  @override
  Future<Result<Token>> signUp({
    final String name = "",
    final String username = "",
    @required final String password,
    @required final String email,
  }) async {
    assert(name.isNotEmpty && name != null);
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
