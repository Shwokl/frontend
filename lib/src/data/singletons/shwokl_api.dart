// External imports
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// An abstraction layer between the API server and our application.
///
/// This singleton handles sending all API requests and parsing the responses
/// received in a format we can more easily use throughout the app.
class ShwoklAPI {
  // Create the singleton instance
  static final ShwoklAPI _instance = ShwoklAPI._constructor();
  factory ShwoklAPI() => _instance;
  ShwoklAPI._constructor();

  // Fields that describe the address of our api server
  static const String apiServer = "10.111.101.116";
  static const String apiPort = "8080";
  static const String apiPath = "/api/v1";
  static const String apiAddr = "http://$apiServer:$apiPort$apiPath";

  /// Sends a POST request to the API server and returns the given response.
  ///
  /// A wrapper on the `http.post(...)` method that sets the address of our api
  /// server, so we only have to pass in the path, and that json encodes the body.
  Future<http.Response> sendRequest({
    @required String path,
    @required Map<String, String> header,
    Map<String, dynamic> body = const {},
  }) async =>
      http.post("$apiAddr$path", headers: header, body: jsonEncode(body));

  /// Send a request to out API server to validate the given credentials.
  ///
  /// Places the given [username] and [password] in the header of the http
  /// request and sends it to the '/login' path of the api server.
  Future<http.Response> login({
    @required String username,
    @required String password,
  }) {
    final Map<String, String> header = {
      'username': username,
      'password': password,
    };

    return sendRequest(path: "/login", header: header);
  }

  /// Send a request to out API server to create a new user.
  ///
  /// Places the given [username], [password], [email] and [name] in the header
  /// of the http request and sends it to the '/register' path of the api server.
  Future<http.Response> register({
    @required String username,
    @required String password,
    @required String email,
    String name = "",
  }) {
    final Map<String, String> header = {
      'username': username,
      'password': password,
      'name': name,
      'email': email,
    };

    return sendRequest(path: "/register", header: header);
  }
}
