// External imports
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Local imports
import 'package:frontend/src/data/shwokl/users/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersInitial());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    yield const UsersLoading();

    if (event is GetUserByIdEvent) {
      final http.Response resp =
          await http.get('http://192.168.15.45:8080/users?id=${event.id}');

      if (resp.statusCode == 200) {
        final User user = User.fromJson(resp.body);

        if (user != null) {
          yield UserLoaded(user);
        } else {
          yield const UsersFailed();
        }
      } else {
        yield const UsersFailed();
      }
    } else if (event is GetAllUsersEvent) {
      final List<User> userList = List.empty(growable: true);

      if (userList.isNotEmpty) {
        yield UserListLoaded(userList);
      } else {
        yield const UsersFailed();
      }
    } else if (event is UpdateUserEvent) {
      final bool status = false;

      yield UserUpdated(status: status);
    } else if (event is ChangePasswordEvent) {
      final bool status = false;

      yield UserUpdated(status: status);
    } else if (event is DeleteUserEvent) {
      final bool status = false;

      yield UserUpdated(status: status);
    }
  }
}
