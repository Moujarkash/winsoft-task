part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginFailure extends LoginState {
  final Failure failure;

  LoginFailure(this.failure);
}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);
}
