import 'package:json_annotation/json_annotation.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String token;
  final String email;

  UserModel(this.token, this.email);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
        _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

extension MapToDomain on UserModel {
  User toDomain() => User(
    token,
    email,
  );
}