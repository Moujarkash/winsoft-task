part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthInProgress extends AuthState {}

class AuthFailure extends AuthState {
  final Failure failure;

  AuthFailure(this.failure);
}

class AuthSuccess extends AuthState {
  final User? user;

  AuthSuccess(this.user);
}
