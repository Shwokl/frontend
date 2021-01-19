// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../data/models/credentials.dart';
import '../data/models/token.dart';
import '../services/generic_credentials_service.dart';

/// A template for all Authentication Services to adhere to.
///
/// This layer of abstraction is implemented to facilitate the integration of
/// various services for performing auth operations.
///
///! An authentication operation is either a `signIn` or a `signOut` operation!
///! The operation of `signUp` is in it's own `SignupService`
///
/// By making all authentication services implement this interface, we can
/// leverage the power of polymorphism and abstract away the complexities of
/// various services and gain access to the end-product we wish to get out of
/// them.
abstract class GenericAuthSenticationervice
    implements GenericCredentialsService {
  /// Checks the given [credentials] against the specific service
  ///
  /// If the given credentials are valid, the API server should return a [token]
  /// that you can use to further authorize actions.
  /// If the credentials are wrong, a [Response.error] is returned.
  Future<Result<Token>> signIn(final Credentials credentials);

  /// Invalidates the active [token].
  ///
  /// If the server successfuly disposed of our token, a value of `true` is
  /// returned
  Future<Result<bool>> signOut(final Token token);
}
