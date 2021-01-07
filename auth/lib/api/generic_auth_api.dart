// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../models/credentials.dart';
import '../models/token.dart';

/// A template for all Authentication APIs to adhere to.
///
/// Regardless of the platform for which the API is implemented, there are only
/// 3 methods that we really care about: `sign in`, `sign out`, `sign up`.
/// This interface is here to ensure that all APIs follow these guidelines.
abstract class GenericAuthApi {
  /// Attempt to validate the given [credentials] against a given service
  Future<Result<String>> singIn(final Credentials credentials);

  /// Attempt to create a new user with the given [credentials] on a given service
  Future<Result<String>> singUp(final Credentials credentials);

  /// Send a request to the given service to invalidate the [token]
  Future<Result<bool>> signOut(Token token);
}
