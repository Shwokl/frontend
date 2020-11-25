import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/singletons/Shwokl_API.dart';
import 'package:http/http.dart';

import 'package:frontend/src/features/_generics_/code/failure.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield const LoginLoading();
    try {
      final Response response = await ShwoklAPI().sendRequest(
        url: "http://192.168.15.51:8080/api/v1/login",
        user: event.username,
        token: event.password,
        method: null,
      );
      if (response.statusCode == 200) {
        yield const LoginSuccess();
      } else {
        yield LoginFail(response.body);
      }
    } on Failure catch (f) {
      yield LoginFail(f.message);
    }
  }
}
