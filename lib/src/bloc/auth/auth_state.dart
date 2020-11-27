part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  final String message;
  const AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}

class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}
