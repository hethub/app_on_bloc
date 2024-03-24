import '../../domain/entities/user_entity.dart';

abstract class AuthState {
  const AuthState();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthDone extends AuthState {
  final UserEntity user;
  const AuthDone(this.user);
}

class AuthError extends AuthState {
  const AuthError();
}

class SigInState extends AuthState {
  const SigInState();
}

class SignOutState extends AuthState {
  const SignOutState();
}
