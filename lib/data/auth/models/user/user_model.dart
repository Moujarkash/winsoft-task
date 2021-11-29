import 'package:json_annotation/json_annotation.dart';
import 'package:winsoft_task/data/auth/models/gender/gender_model.dart';
import 'package:winsoft_task/domain/auth/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final GenderModel gender;
  final DateTime dateOfBirth;

  UserModel(this.token, this.firstName, this.lastName, this.email, this.phone, this.gender, this.dateOfBirth);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
        _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

extension MapToDomain on UserModel {
  User toDomain() => User(
    token,
    firstName,
    lastName,
    email,
    phone,
    gender.toDomain(),
    dateOfBirth
  );
}