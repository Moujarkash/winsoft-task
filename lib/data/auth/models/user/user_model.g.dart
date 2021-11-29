// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['token'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['phone'] as String,
      $enumDecode(_$GenderModelEnumMap, json['gender']),
      DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderModelEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };

const _$GenderModelEnumMap = {
  GenderModel.male: 'male',
  GenderModel.female: 'female',
  GenderModel.other: 'other',
};
