import 'package:dartz/dartz.dart';
import 'package:winsoft_task/domain/auth/entities/gender.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/repositories/base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  Future<Either<Failure, User?>> getSignedInUser();

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signup(
      {required String firstName,
        required String lastName,
        required String email,
        required String password,
        required String phone,
        required Gender gender,
        required DateTime dateOfBirth});
}