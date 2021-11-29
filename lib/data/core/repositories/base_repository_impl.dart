import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/repositories/base_repository.dart';
import 'package:winsoft_task/domain/core/utils/constants.dart';
import 'package:winsoft_task/domain/core/utils/network/network_info.dart';

class BaseRepositoryImpl implements BaseRepository {
  final NetworkInfo _networkInfo;

  BaseRepositoryImpl(this._networkInfo,);

  @override
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body) async {
    try {
      if (!await _networkInfo.isConnected) {
        return left(ServerFailure(errorCode: ErrorCode.noInternetConnection));
      }

      return await body();
    } catch (e) {
      debugPrint(e.toString());

      return left(ServerFailure(errorCode: ErrorCode.serverError));
    }
  }
}
