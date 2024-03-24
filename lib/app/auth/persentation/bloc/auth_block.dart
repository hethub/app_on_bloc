import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/app/auth/domain/entities/user_entity.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/signin_user.dart';
import '../../domain/usecases/signout_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUser getUser;
  final RegisterUser registerUser;
  final SignInUser signInUser;
  final SignOutUser signOutUser;
  AuthBloc({
    required this.getUser,
    required this.registerUser,
    required this.signInUser,
    required this.signOutUser,
  }) : super(const AuthLoading()) {
    on<GetUserEvent>((event, emit) => onGetUser(event, emit));
    on<SignInEvent>((event, emit) => signIn(event, emit));
    on<SignOutEvent>((event, emit) => signOut(event, emit));
    on<SignUpEvent>((event, emit) => signUpUser(event, emit));
  }
  UserEntity? _userCredentials;
  UserEntity? get userCredentials {
    return _userCredentials;
  }

  set userCredentials(UserEntity? user) {
    _userCredentials = user;
  }

  String _email = '';
  // String get email => _email;
  set email(String e) {
    _email = e;
  }

  String _password = '';
  // String get password => _password;
  set password(String p) {
    _password = p;
  }

  void signUpUser(SignUpEvent event, Emitter<AuthState> emit) async {
    final singnup = await registerUser(params: _userCredentials);
    if (singnup) {
      emit(AuthDone(_userCredentials!));
    } else {
      emit(const AuthError());
    }
  }

  void onGetUser(GetUserEvent event, Emitter<AuthState> emit) async {
    final user = await getUser();
    userCredentials = user;
    if (user?.isSignIN == true) {
      emit(AuthDone(user!));
    } else {
      emit(const SignOutState());
    }
  }

  void signIn(SignInEvent event, Emitter<AuthState> emit) async {
    bool userIn = false;
    if (_userCredentials == null) return;
    emit(const AuthLoading());

    if (_userCredentials!.email == _email &&
        _userCredentials!.password == _password) {
      userIn = await signInUser(params: _userCredentials);
    }

    if (userIn) {
      emit(AuthDone(_userCredentials!));
    } else {
      emit(const AuthError());
    }
  }

  void signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    if (_userCredentials == null) return;
    emit(const AuthLoading());
    final out = UserEntity(
      userId: _userCredentials!.userId,
      email: _userCredentials!.email,
      password: _userCredentials!.password,
      isSignIN: false,
    );

    final userOut = await signOutUser(params: out);
    if (userOut) {
      emit(const SignOutState());
    } else {
      emit(const AuthError());
    }
  }
}
