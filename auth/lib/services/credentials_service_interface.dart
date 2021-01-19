import '../data/models/credentials.dart';

/// A template for all Services that work with credentials to adhere to.
abstract class ICredentialsService {
  /// Bundle up all the given fields into a `Credentials` object
  Credentials buildCredentials();
}
