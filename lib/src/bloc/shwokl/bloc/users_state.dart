part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {
  const UsersInitial();

  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {
  const UsersLoading();

  @override
  List<Object> get props => [];
}

class UserLoaded extends UsersState {
  final User user;
  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserListLoaded extends UsersState {
  final List<User> list;
  const UserListLoaded(this.list);

  @override
  List<Object> get props => [list];
}

class UserUpdated extends UsersState {
  final bool status;
  const UserUpdated({@required this.status});

  @override
  List<Object> get props => [status];
}

class UsersFailed extends UsersState {
  const UsersFailed();

  @override
  List<Object> get props => [];
}
