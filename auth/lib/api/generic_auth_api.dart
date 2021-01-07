// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../models/credentials.dart';
import '../models/token.dart';

abstract class GenericAuthApi {
  Future<Result<String>> singIn(final Credentials credentials);
  Future<Result<String>> singUp(final Credentials credentials);
  Future<Result<bool>> signOut(Token token);
}
