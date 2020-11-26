import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/singletons/shwokl_api.dart';
import 'package:http/http.dart' as http;

import 'package:frontend/src/features/_generics_/code/failure.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield const RegisterLoading();
    try {
      final http.Response response = await ShwoklAPI().register(
        username: event.username,
        password: event.password,
        name: event.name,
        email: event.email,
      );
      if (response.statusCode == 200) {
        yield const RegisterSuccess();
      } else {
        yield RegisterFail(response.body);
      }
    } on Failure catch (f) {
      yield RegisterFail(f.message);
    } catch (e) {
      yield RegisterFail(e.toString());
    }
  }
}
