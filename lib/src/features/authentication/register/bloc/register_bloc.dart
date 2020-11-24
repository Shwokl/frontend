import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/features/_generics_/code/failure.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterLoading();
    try {
      // todo API register attempt
      await Future.delayed(Duration(seconds: 1));
      yield RegisterSuccess();
    } on Failure catch (f) {
      yield RegisterFail(f.message);
    }
  }
}
