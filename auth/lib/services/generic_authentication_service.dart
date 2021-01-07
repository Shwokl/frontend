// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../models/credentials.dart';
import '../models/token.dart';

abstract class GenericAuthService {
  Future<Result<Token>> signIn(final Credentials credentials);
  Future<Result<bool>> signOut(final Token token);
}
