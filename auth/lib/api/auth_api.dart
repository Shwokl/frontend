// External imports
import 'dart:convert' show jsonDecode;
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;
import 'package:http/http.dart' as http;

// Local imports
import '../models/credentials.dart';
import '../models/token.dart';
import 'generic_auth_api.dart';

class AuthApi implements GenericAuthApi {
  final http.Client _client;
  final String _baseUrl;

  const AuthApi(this._client, this._baseUrl);

  @override
  Future<Result<String>> singIn(Credentials credentials) {
    return _sendPost(
      url: "$_baseUrl/auth/login",
      body: credentials.toMap(),
    );
  }

  @override
  Future<Result<String>> singUp(Credentials credentials) {
    return _sendPost(
      url: "$_baseUrl/auth/register",
      body: credentials.toMap(),
    );
  }

  @override
  Future<Result<bool>> signOut(Token token) async {
    final Result response = await _sendPost(
      url: "$_baseUrl/auth/signout",
      header: {
        "Content-type": "application/json",
        "Authorization": token.value,
      },
    );

    if (response.isError) return response.asError;
    return Result.value(
      response.asValue.value.toString().toLowerCase() == "true",
    );
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
