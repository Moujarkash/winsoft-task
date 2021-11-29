part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupInProgress extends SignupState {}

class SignupFailure extends SignupState {
  final Failure failure;

  SignupFailure(this.failure);
}

class SignupSuccess extends SignupState {
  final User user;

  SignupSuccess(this.user);
}
