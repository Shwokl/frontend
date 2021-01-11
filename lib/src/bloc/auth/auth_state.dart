part of 'auth_bloc.dart';

/// Abstract class used as a base for all other Authentication States.
///
/// The flow of states is:
///                                  -> [AuthSuccess]
/// [AuthInitial] -> [AuthLoading] -|
///                                  -> [AuthFailed]
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// The initial state in the authentication process.
///
/// No credentials have been passed around yet. This state is basically an idle
/// state in which our app is waiting for the user to do something, i.e. log in
/// or sign up.
/// Nothing is really happening here.
class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

/// The second state in the flow of the authentication process.
///
/// The user has either attempted a login or a signup action, and the request
/// is being sent to the API server. We are currently waiting for a response.
/// In this state, the UI should show some form of a loading animation or
/// something like that, to notify the user that something is happening and that
/// they should wait.
class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

/// One of the options for the third state in the flow of the auth process.
///
/// The user has attempted a login/signup action, the credentials have been sent
/// to the api server and it has responded with a status code other than '200'.
/// This means something went wrong. Either the credentials are invalid (in the
/// case of login), the user already exists (in the case of signup), or something
/// went wrong somewhere else along the stack. Either way, none shall pass.
class AuthFailed extends AuthState {
  final String message; // a description of the failure that took place
  const AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}

/// The final option for the third state in the flow of the auth process.
///
/// The user has attempted a login/signup action, the credentials have been sent
/// to the api server and it has responded with a status code of 200.
/// All is good.
/// If the action was a login, then we can send the user to their
/// dashboard. If the action was a signup, we can send them to the login page.
class AuthSuccess extends AuthState {
  final String
      message; // some extra bits of information returned from the server
  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}
