// External imports
import 'dart:convert' show jsonDecode;
import 'package:async/async.dart' show Result;
import 'package:flutter/foundation.dart' show required;
import 'package:http/http.dart' as http;

// Local imports
import '../data/models/credentials.dart';
import '../data/models/token.dart';
import 'auth_api_interface.dart';

/// A basic authentication and registration API
class AuthApi implements IAuthApi {
  final http.Client _client; // http client used to make http requests
  final String _baseUrl; // the base endpoint for our api
  String signInRoute = '/auth/login';
  String signUpRoute = '/auth/register';
  String signOutRoute = '/auth/logout';

  // Constructor
  AuthApi(this._client, this._baseUrl);

  /// Send an http request to the [signInRoute] endpoint of the API, with
  /// the [credentials] in the body.
  ///
  /// If no [signInRoute] is specified, the default of '/auth/login' is used.
  /// The server returns an access token if the credentials are correct, or an
  /// error otherwise.
  @override
  Future<Result<String>> singIn(Credentials credentials) {
    return _sendPost(url: "$_baseUrl/$signInRoute", body: credentials.toMap());
  }

  /// Send an http request to the [signUpRoute] endpoint of the API, with the
  /// [credentials] in the body.
  ///
  /// If no [signUpRoute] is specified, the default of '/auth/register' is used.
  /// The server returns an access token if the creation was successful, or an
  /// error otherwise.
  @override
  Future<Result<String>> singUp(Credentials credentials) {
    return _sendPost(url: "$_baseUrl/$signUpRoute", body: credentials.toMap());
  }

  /// Send an http request to the [signOutRoute] endpoint of the API, with the
  /// [token] in the header.
  ///
  /// If no [signOutRoute] is specified, the default of '/auth/logout' is used.
  /// The server returns a boolean indicating whether or not the token was disposed of.
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

  /// A wrapper for `http.Client.post(...)`.
  ///
  /// This function assumes a defaul [header] of { "Content-type": "application/json" }
  /// if nothing else is provided and an empty [body].
  /// The only required field is the actual [url] at which the request will be
  /// sent.
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
    if (json['result'] == null) {
      return Result.error(json['message']);
    } else {
      return Result.value(json['result'].toString());
    }
  }
}
