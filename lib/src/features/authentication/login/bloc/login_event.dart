part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final String username;
  final String password;

  const LoginEvent({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [this.username, this.password];
}
