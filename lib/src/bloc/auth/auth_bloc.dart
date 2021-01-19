// Outside imports
import 'package:meta/meta.dart' show required;
import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:auth/auth.dart' as shwokl;

// Local imports
import '../../data/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// Handle all authentication requests to the api server.
///
/// This BLoC handles all the [AuthEvents] (either [LoginEvent] or [SignUpEvent])
/// by sending the appropriate request to the API server via the [ShwoklAPI]
/// singleton.
/// [LoginEvents] represent a [ShwoklAPI.login(...)] method, and [SignUpEvents]
/// represent a [ShwoklAPI.signup(...)] method.
///
/// Initially, we are in the [AuthInitial] state. No data has been entered yet.
/// We are waiting for the user to perform an action.
///
/// Once some data has been passed to the BLoC, we automatically enter the
/// [AuthLoading] state. This state indicates that the auth/register process
/// is taking place, i.e. the request has been sent to the server and we are
/// waiting for a response.
///
/// If any request gets a status code 200 response from the server, then the
/// authentication or registration was successfull, and, as such, an
/// [AuthSuccess] state is yielded. Otherwise, we get to the [AuthFailed] state.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield const AuthLoading();

    try {
      final shwokl.IAuthApi api = shwokl.AuthApi('http://192.168.15.51:8181');

      // If our event is of the [LoginEvent] type, we send a login request to
      // the api server, and yield either an [AuthSuccess] state, if the response
      // is 200, or and [AuthFailed] otherwise
      if (event is LoginEvent) {
        final Result<String> loginResult = await api.singIn(
          shwokl.Credentials(
            username: event.username,
            password: event.password,
          ),
          rememberMe: event.rememberMe,
        );

        if (loginResult.isError) {
          yield AuthFailed(loginResult.asError.error.toString());
        } else {
          yield AuthSuccess(loginResult.asValue.value);
          // todo cache the token
        }
      }

      // If our event is of the [SignupEvent] type, we send a signup request to
      // the api server, and yield either an [AuthSuccess] state, if the response
      // is 200, or and [AuthFailed] otherwise
      if (event is SignupEvent) {
        final Result<String> signupResult = await api.singUp(shwokl.Credentials(
          username: event.username,
          password: event.password,
          email: event.email,
          name: event.name,
        ));

        if (signupResult.isError) {
          yield AuthFailed(signupResult.asError.error.toString());
        } else {
          yield AuthSuccess(signupResult.asValue.value);
          // todo cache the token
        }
      }

      if (event is LogoutEvent) {
        final Result<bool> logoutResult = await api.signOut(
          shwokl.Token(value: event.token),
        );

        if (logoutResult.isError) {
          yield LogoutFailed(logoutResult.asError.error.toString());
        } else {
          yield const LogoutSuccess();
          // todo remove token from cache
        }
      }
    } on Failure catch (f) {
      print(f.message);
      yield AuthFailed(f.message);
    }
  }
}
