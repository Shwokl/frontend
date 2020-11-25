part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  final String name;
  final String username;
  final String email;
  final String password;

  const RegisterEvent({
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name, username, email, password];
}
