import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain/Repository/authentication_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpEvent) {
      yield AuthLoading();
      try {
        final userCredential = await _authRepository.signUp(
          event.email,
          event.password,
        );
        yield AuthAuthenticated(userCredential.user!);
      } catch (e) {
        yield AuthError('Sign up failed');
      }
    } else if (event is SignInEvent) {
      yield AuthLoading();
      try {
        final userCredential = await _authRepository.signIn(
          event.email,
          event.password,
        );
        yield AuthAuthenticated(userCredential.user!);
      } catch (e) {
        yield AuthError('Sign in failed');
      }
    } else if (event is SignOutEvent) {
      yield AuthLoading();
      try {
        await _authRepository.signOut();
        yield AuthInitial();
      } catch (e) {
        yield AuthError('Sign out failed');
      }
    } else if (event is SignInWithGoogleEvent) {
      yield AuthLoading();
      try {
        final userCredential = await _authRepository.signInWithGoogle();
        yield AuthAuthenticated(userCredential.user!);
      } catch (e) {
        yield AuthError('Google sign-in failed');
      }
    } else if (event is SignInWithFacebookEvent) {
      yield AuthLoading();
      try {
        final userCredential = await _authRepository.signInWithFacebook();
        yield AuthAuthenticated(userCredential.user!);
      } catch (e) {
        yield AuthError('Facebook login failed');
      }
    }
  }
}
