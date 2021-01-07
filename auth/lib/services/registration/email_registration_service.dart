// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../../api/generic_auth_api.dart';
import '../../models/credentials.dart';
import '../../models/token.dart';
import '../../services/registration/generic_registration_service.dart';

/// A registration service that accepts a `(email, password)` pair.
class EmailRegistrationService implements GenericRegistrationService {
  final GenericAuthApi _api; // The api to which we 'forward' requests

  // Constructor
  const EmailRegistrationService(this._api);

  /// Attempt to create a user with the give
  @override
  Future<Result<Token>> signUp(final Credentials credentials) async {
    // Ensure proper credentials have been passed
    assert(credentials != null && credentials.method == AuthMethod.email);

    // Send the actual api request
    final Result<String> result = await _api.singUp(credentials);

    // Parse the response
    if (result.isError) {
      return result.asError;
    } else {
      return Result.value(Token(value: result.asValue.value));
    }
  }
}
