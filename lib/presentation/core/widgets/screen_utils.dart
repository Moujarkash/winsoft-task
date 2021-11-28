import 'package:flutter/material.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/utils/constants.dart';

mixin ScreenUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {Failure? failure,
      String? customMessage,
      Map<ErrorCode, String>? customMessages,
      bool isFloating = false}) {
    String message = customMessage ?? 'OOPS! Something went wrong';

    if (failure != null && failure is ServerFailure) {
      if (failure is ServerFailure) {
        if (failure.errorCode == ErrorCode.noInternetConnection) {
          message = 'No Internet Connection';
        } else if (failure.message.isNotEmpty) {
          message = failure.message;
        } else if (customMessages != null && customMessages.isNotEmpty) {
          message = customMessages[failure.errorCode] ?? message;
        }
      } else if (failure is LogicFailure) {
        if ((failure as LogicFailure?)!.message.isNotEmpty) {
          message = (failure as LogicFailure?)!.message;
        }
      }
    }

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).errorColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, bool isFloating = false}) {
    String message = customMessage ?? 'Success';

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
