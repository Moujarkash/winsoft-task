enum Gender {
  male,
  female,
  other
}

extension ParseToString on Gender {
  String toShortString() {
    return toString().split('.').last;
  }
}