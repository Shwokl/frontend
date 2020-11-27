import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/src/data/models/failure.dart';
import 'package:http/http.dart' as http;

/// A singleton meant to handle all the API calls to the Kanbaord Server
class ShwoklAPI {
  static final ShwoklAPI _instance = ShwoklAPI._constructor();
  factory ShwoklAPI() => _instance;
  ShwoklAPI._constructor();

  ///
  /// [_sendPostRequest] sends a POST request to the Shwokl API server
  /// and throws a [Failure] if an exception is caught
  ///
  Future<http.Response> sendRequest({
    @required String url,
    @required Map<String, String> header,
    Map<String, dynamic> body = const {},
  }) async =>
      http.post(url, headers: header, body: jsonEncode(body));

  Future<http.Response> login({
    @required String username,
    @required String password,
  }) =>
      sendRequest(
        url: "http://192.168.15.51:8080/api/v1/login",
        header: {
          'username': username,
          'password': password,
        },
      );

  Future<http.Response> register({
    @required String username,
    @required String password,
    String name = "",
    String email = "",
  }) =>
      sendRequest(
        url: "http://192.168.15.51:8080/api/v1/register",
        header: {
          'username': username,
          'password': password,
          'name': name,
          'email': email,
        },
        body: {},
      );
}
