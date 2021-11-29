import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/repositories/auth_repository.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/usecases/usecase.dart';

@lazySingleton
class GetSignedInUserUseCase extends UseCase<User?, NoParams> {
  final AuthRepository repository;

  GetSignedInUserUseCase(this.repository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return repository.getSignedInUser();
  }
}