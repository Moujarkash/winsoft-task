import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:winsoft_task/data/auth/models/user/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login({required String email, required String password});
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {

  @override
  Future<UserModel> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(const Uuid().v4(), email);
  }
}