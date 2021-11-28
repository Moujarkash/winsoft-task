import 'package:winsoft_task/domain/core/utils/constants.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ErrorCode errorCode;
  final String message;

  ServerFailure({required this.errorCode, this.message = ''});
}

class CacheFailure implements Failure {}

class LogicFailure implements Failure {
  final String message;

  LogicFailure(this.message);
}
