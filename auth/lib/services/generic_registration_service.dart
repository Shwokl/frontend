// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../data/models/credentials.dart';
import '../data/models/token.dart';
import '../services/generic_credentials_service.dart';

/// A template for all `RegistrationServices` to adhere to.
///
/// This layer of abstraction is implemented to facilitate the integration of
/// various services for performing registration operations.
/// The required operations for any Servicee to qualify as a RegistrationService
/// are: `signUp`
abstract class GenericRegistrationService implements GenericCredentialsService {
  /// Creates a new user via the specified service
  ///
  /// If the user is created successfuly, an access [token] should be returned
  /// that can be used to authorize any subsequent actions.
  Future<Result<Token>> signUp(final Credentials credentials);
}
