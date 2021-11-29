import 'package:winsoft_task/domain/auth/entities/gender.dart';

enum GenderModel {
  male,
  female,
  other
}

extension ParseToString on GenderModel {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension MapToDomain on GenderModel {
  Gender toDomain() => Gender.values.firstWhere(
        (element) => element.toShortString() == toShortString(),
  );
}

GenderModel genderModelFromDomain(
    Gender gender) {
  return GenderModel.values.firstWhere(
          (element) => element.toShortString() == gender.toShortString());
}