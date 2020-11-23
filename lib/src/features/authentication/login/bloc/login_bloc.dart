import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/features/_generics_/code/failure.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield LoginLoading();
    try {
      // todo API login attempt
      yield LoginSuccess();
    } on Failure catch (f) {
      yield LoginFail(f.message);
    }
  }
}
