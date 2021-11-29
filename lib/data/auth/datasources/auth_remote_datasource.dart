import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:winsoft_task/data/auth/models/gender/gender_model.dart';
import 'package:winsoft_task/data/auth/models/user/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> signup({required String firstName, required String lastName, required String email, required String password, required String phone, required GenderModel gender, required DateTime dateOfBirth});
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {

  @override
  Future<UserModel> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(const Uuid().v4(), 'mod', 'mod', email, '963997142092', GenderModel.male, DateTime(1995, 2, 24));
  }

  @override
  Future<UserModel> signup({required String firstName, required String lastName, required String email, required String password, required String phone, required GenderModel gender, required DateTime dateOfBirth}) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(const Uuid().v4(), firstName, lastName, email, phone, gender, dateOfBirth);
  }
}