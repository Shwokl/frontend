// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../../api/generic_auth_api.dart';
import '../../models/credentials.dart';
import '../../models/token.dart';
import 'generic_authentication_service.dart';

class EmailAuthenticationService implements GenericAuthService {
  final GenericAuthApi _api;

  const EmailAuthenticationService(this._api);

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
}
