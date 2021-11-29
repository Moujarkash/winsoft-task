import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:winsoft_task/data/auth/datasources/auth_local_datasource.dart';
import 'package:winsoft_task/data/auth/datasources/auth_remote_datasource.dart';
import 'package:winsoft_task/data/auth/models/gender/gender_model.dart';
import 'package:winsoft_task/data/auth/models/user/user_model.dart';
import 'package:winsoft_task/data/core/repositories/base_repository_impl.dart';
import 'package:winsoft_task/domain/auth/entities/gender.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';
import 'package:winsoft_task/domain/auth/repositories/auth_repository.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/utils/network/network_info.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;
  final AuthLocalDatasource local;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(this.remote, this.local, this.networkInfo)
      : super(networkInfo);

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    return right(local.getSignedInUser()?.toDomain());
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return request(() async {
      final userModel = await remote.login(email: email, password: password);
      local.signInUser(userModel);
      return right(userModel.toDomain());
    });
  }

  @override
  Future<Either<Failure, User>> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone,
      required Gender gender,
      required DateTime dateOfBirth}) async {
    return request(() async {
      final userModel = await remote.signup(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        gender: genderModelFromDomain(gender),
        dateOfBirth: dateOfBirth,
        phone: phone,
      );
      local.signInUser(userModel);
      return right(userModel.toDomain());
    });
  }
}
