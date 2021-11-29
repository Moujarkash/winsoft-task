import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:winsoft_task/domain/auth/entities/gender.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/repositories/auth_repository.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/usecases/usecase.dart';

@lazySingleton
class SignupUseCase extends UseCase<User, SignupUseCaseParams> {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignupUseCaseParams params) {
    return repository.signup(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        phone: params.phone,
        gender: params.gender,
        dateOfBirth: params.dateOfBirth);
  }
}

class SignupUseCaseParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final Gender gender;
  final DateTime dateOfBirth;

  SignupUseCaseParams(this.firstName, this.lastName, this.email, this.password,
      this.phone, this.gender, this.dateOfBirth);
}
