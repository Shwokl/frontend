import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:frontend/src/data/singletons/shwokl_api.dart';
import 'package:frontend/src/data/models/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield const AuthLoading();

    try {
      Response response;

      if (event is LoginEvent) {
        response = await ShwoklAPI().login(
          username: event.username,
          password: event.password,
        );
        if (response.statusCode == 200) {
          print(response.body);
          yield const AuthSuccess("Welcome");
        } else {
          print(response.body);
          yield AuthFailed(response.body);
        }
      }

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
      print(f.message);
      yield AuthFailed(f.message);
    }
  }
}
