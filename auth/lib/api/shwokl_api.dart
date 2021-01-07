// External imports
import 'dart:convert' show jsonDecode;
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;
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

  Future<Result<String>> _sendPost({
    @required final String url,
    final Map<String, String> header = const {
      "Content-type": "application/json"
    },
    final Map<String, dynamic> body = const {},
  }) async {
    final http.Response response =
        await _client.post(url, body: body, headers: header);

    final dynamic json = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return Result.error(json['message']);
    }
    if (json['token'] == null) {
      return Result.error(json['message']);
    } else {
      return Result.value(json['token'].toString());
    }
  }
}
