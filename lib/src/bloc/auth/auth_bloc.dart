// Outside imports
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// Local imports
import '../../data/failure.dart';
import '../../data/singletons/shwokl_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// Handle all authentication requests to the api server.
/// 
/// This BLoC handles all the [AuthEvents] (either [LoginEvent] or [SignUpEvent])
/// by sending the appropriate request to the API server via the [ShwoklAPI]
/// singleton.
/// [LoginEvents] represent a [ShwoklAPI.login(...)] method, and [SignUpEvents]
/// represent a [ShwoklAPI.signup(...)] method.
/// 
/// Initially, we are in the [AuthInitial] state. No data has been entered yet.
/// We are waiting for the user to perform an action.
/// 
/// Once some data has been passed to the BLoC, we automatically enter the
/// [AuthLoading] state. This state indicates that the auth/register process
/// is taking place, i.e. the request has been sent to the server and we are
/// waiting for a response.
/// 
/// If any request gets a status code 200 response from the server, then the
/// authentication or registration was successfull, and, as such, an 
/// [AuthSuccess] state is yielded. Otherwise, we get to the [AuthFailed] state.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield const AuthLoading();

    try {
      // The http response from the API call we're about to make
      Response response;

      // If our event is of the [LoginEvent] type, we send a login request to
      // the api server, and yield either an [AuthSuccess] state, if the response
      // is 200, or and [AuthFailed] otherwise
      if (event is LoginEvent) {
        response = await ShwoklAPI().login(
          username: event.username,
          password: event.password,
        );

        if (response.statusCode == 200) {
          yield const AuthSuccess("Welcome");
        } else {
          print(response.body);
          yield AuthFailed(response.body);
        }
      }

      // If our event is of the [SignupEvent] type, we send a signup request to
      // the api server, and yield either an [AuthSuccess] state, if the response
      // is 200, or and [AuthFailed] otherwise
      if (event is SignupEvent) {
        response = await ShwoklAPI().register(
          username: event.username,
          password: event.password,
          name: event.name,
          email: event.email,
        );

        if (response.statusCode == 200) {
          yield const AuthSuccess(
              "User added successfully.\nYou can now log in");
        } else {
          print(response.body);
          yield AuthFailed(response.body);
        }
      }
    } on Failure catch (f) {
      // if something went wrong sending the api call
      print(f.message);
      yield AuthFailed(f.message);
    }
  }
}
