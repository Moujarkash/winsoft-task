part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupRequested extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final Gender gender;
  final DateTime dateOfBirth;

  SignupRequested(this.firstName, this.lastName, this.email, this.password,
      this.phone, this.gender, this.dateOfBirth);
}
