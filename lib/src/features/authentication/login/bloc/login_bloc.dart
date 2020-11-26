import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/singletons/shwokl_api.dart';
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
      final Response response = await ShwoklAPI().login(
        username: event.username,
        password: event.password,
      );
      if (response.statusCode == 200) {
        print(response.body);
        yield const LoginSuccess();
      } else {
        print(response.body);
        yield LoginFail(response.body);
      }
    } on Failure catch (f) {
      yield LoginFail(f.message);
    }
  }
}
