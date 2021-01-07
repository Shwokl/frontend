// External imports
import 'package:async/async.dart' show Result;
import 'package:http/http.dart' as http;

// Local imports
import '../api/generic_auth_api.dart';
import '../models/credentials.dart';
import '../models/token.dart';

class ShwoklApi implements GenericAuthApi {
  final http.Client _client;
  final String _baseUrl;

  const ShwoklApi(this._client, this._baseUrl);

  @override
  Future<Result<bool>> signOut(Token token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> singIn(Credentials credentials) {
    // TODO: implement singIn
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> singUp(Credentials credentials) {
    // TODO: implement singUp
    throw UnimplementedError();
  }
}
