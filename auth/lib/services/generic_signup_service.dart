// External imports
import 'package:async/async.dart' show Result;

// Local imports
import '../models/token.dart';

abstract class GenericSignupService {
  Future<Result<Token>> signup();
}
