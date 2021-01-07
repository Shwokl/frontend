// External imports
import 'package:async/async.dart' show Result;

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
  Future<Result<Token>> signIn(Credentials credentials) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> signOut(Token token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
