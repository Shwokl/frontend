import 'dart:async';
import 'dart:io';
import 'package:frontend/src/features/_generics_/code/failure.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

/// A singleton meant to handle all the API calls to the Kanbaord Server
class ShwoklAPI {
  static final ShwoklAPI _instance = ShwoklAPI._constructor();
  factory ShwoklAPI() => _instance;
  ShwoklAPI._constructor();

  ///
  /// [_getHttpClient] returns a custom http client with a 3sec timeout and
  /// custom badCertificateCallback method
  ///
  HttpClient _getHttpClient(bool acceptCerts) {
    final HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback = (_cert, _host, _port) => acceptCerts;
    httpClient.connectionTimeout = const Duration(seconds: 3);
    return httpClient;
  }

  ///
  /// [_sendPostRequest] sends a POST request to the Shwokl API server
  /// and throws a [Failure] if an exception is caught
  ///
  Future<Response> sendRequest({
    @required String url,
    @required String user,
    @required String token,
    int id = 1,
    @required String method,
    Map<String, String> params,
    bool acceptCerts = true,
  }) async {
    final HttpClient httpClient = _getHttpClient(acceptCerts);
    final IOClient ioClient = IOClient(httpClient);
    Map<String, String> header = {'username': user, 'password': token};
    Map<String, dynamic> body = {'id': id, 'method': method, 'params': params};
    print(header);
    print(body);
    Response response;

    response = await ioClient.post(url, headers: header, body: body);
    ioClient.close();
    return response;
  }

  ///
  /// [testConnection] sends a request to
  /// http://api_server:api_port/api/path/ping
  /// And expects the 'pong' response
  ///
  Future<Response> testConnection() async {
    Response response = await sendRequest(
      url: "http://192.168.15.51:8080/api/v1/ping",
      acceptCerts: true,
      method: null,
      user: null,
      token: null,
    );
    print(response);
    return response;
  }
}
