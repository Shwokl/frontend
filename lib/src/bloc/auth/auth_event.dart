part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class SignupEvent extends AuthEvent {
  final String name;
  final String username;
  final String email;
  final String password;

  const SignupEvent({
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name, username, email, password];
}
