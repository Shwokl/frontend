part of 'auth_bloc.dart';

/// Abstract class used as a base for all Authentication events.
///
/// The only possible authentication events are either a [LoginEvent], which
/// attempts to validate the given credentials, assuming an already existing
/// user, against our database, or a [SingupEvent] which attempts to create a
/// new user with the given information.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event meant to authenticate an already existing user.
///
/// Sends an API request that validates the given [username] and [password]
/// credentials  against the database.
///
/// In response, if the credentials are correct, the server will respond with a
/// 200 status code. This means we can safely let the user through as they have
/// successfully authenticated.
/// Any other status code other than 200 indicates an error, be it wrong
/// credentials, bad network connection or any other error along the stack.
///
///! NOTE: both the username and password fields are REQUIRED, as no
///!      authentication can be done without either of them. (duh)
class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  final bool rememberMe;

  const LoginEvent({
    @required this.username,
    @required this.password,
    @required this.rememberMe,
  });

  @override
  List<Object> get props => [username, password, rememberMe];
}

/// Event meant to register a new user to the database.
///
/// Sends an API request that attempts to create a new user in our app database.
/// Any user is defined by a number of properties, such as:
///   - [name]: the actual name of the person
///   - [username]: their in-app name
///   - [email]: the email address of the user
///   - [password]: the password they use to log in
///
///
/// In response, if the user information is correct, the server will respond
/// with a 200 status code. This means the user doesn't already exist and it was
/// successfully added to the database.
/// Any other status code other than 200 indicates an error, be it wrong
/// credentials, bad network connection or any other error along the stack.
///
///! NOTE: the only non-mandatory field is the [name], as it is the only one
///!      that is non-vital. The [username] and [password] are used for login
///!      and the email is used to reset a forgotten password.
class SignupEvent extends AuthEvent {
  final String name;
  final String username;
  final String email;
  final String password;

  const SignupEvent({
    this.name = "", // if no name is provided, an empty string is used instead
    @required this.username,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name, username, email, password];
}

/// Event meant to unauthenticate (log out) the currently logged in user.
///
/// Sends an API request that attempts to invalidate the given [token] from the
/// server.
///
/// In response, if the token was disposed of, the server should respond with a
/// 200 status code. This means the token was invalidated and we should redirect
/// the user to the home page.
/// Any other response means the token was not disposed of and the session is
/// still alive.
class LogoutEvent extends AuthEvent {
  final String token;

  const LogoutEvent(this.token);

  @override
  List<Object> get props => [token];
}
