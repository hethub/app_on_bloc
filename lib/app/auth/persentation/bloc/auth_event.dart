abstract class AuthEvent {
  const AuthEvent();
}

class GetUserEvent extends AuthEvent {
  const GetUserEvent();
}
class SignUpEvent extends AuthEvent {
  const SignUpEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
