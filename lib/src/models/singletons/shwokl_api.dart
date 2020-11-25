import 'dart:convert';

import 'package:frontend/src/features/_generics_/code/failure.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
    // url:
    @required String url,
    // header:
    @required String user,
    @required String token,
    // params
    int id = 1,
    @required String method,
    Map<String, String> params,
  }) async {
    final Map<String, String> header = {'username': user, 'password': token};
    final Map<String, dynamic> body = {'id': id, 'method': method, 'params': params};
    return http.post(url, headers: header, body: jsonEncode(body));
  }
}
