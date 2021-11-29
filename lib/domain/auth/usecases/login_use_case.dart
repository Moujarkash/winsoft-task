import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/repositories/auth_repository.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/usecases/usecase.dart';

@lazySingleton
class LoginUseCase extends UseCase<User, LoginUseCaseParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginUseCaseParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams(this.email, this.password);
}