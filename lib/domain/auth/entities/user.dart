import 'package:winsoft_task/domain/auth/entities/gender.dart';

class User {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final Gender gender;
  final DateTime dateOfBirth;

  User(this.token, this.firstName, this.lastName, this.email, this.phone, this.gender, this.dateOfBirth);
}