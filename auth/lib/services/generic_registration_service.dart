// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../models/token.dart';

/// A template for all Registration Services to adhere to.
///
/// This layer of abstraction is implemented to facilitate the integration of
/// various services for performing registration operations.
abstract class GenericRegistrationService {
  /// Creates a new user via the specified service
  Future<Result<Token>> signup();
}
