part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUserByIdEvent extends UsersEvent {
  final int id;
  const GetUserByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetAllUsersEvent extends UsersEvent {
  const GetAllUsersEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends UsersEvent {
  final User user;
  const UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class ChangePasswordEvent extends UsersEvent {
  final String username, password;
  const ChangePasswordEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class DeleteUserEvent extends UsersEvent {
  final int userId;
  const DeleteUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
