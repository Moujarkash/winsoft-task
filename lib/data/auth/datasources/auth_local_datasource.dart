import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winsoft_task/data/auth/models/user/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> signInUser(UserModel user);

  UserModel? getSignedInUser();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;
  final String _userKey = 'USER_KEY';

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> signInUser(UserModel user) async {
    await sharedPreferences.setString(
      _userKey,
      json.encode(user.toJson()),
    );
  }

  @override
  UserModel? getSignedInUser() {
    if (!sharedPreferences.containsKey(_userKey)) return null;

    return UserModel.fromJson(
      json.decode(sharedPreferences.getString(_userKey)!)
      as Map<String, dynamic>,
    );
  }
}