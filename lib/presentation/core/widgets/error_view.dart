import 'package:flutter/material.dart';
import 'package:winsoft_task/domain/core/entities/failures.dart';
import 'package:winsoft_task/domain/core/utils/constants.dart';

typedef OnRetry = Function();

class ErrorView extends StatelessWidget {
  final String? message;
  final OnRetry? onRetry;
  final Failure? failure;
  final Map<ErrorCode, String>? customMessages;

  const ErrorView(
      {Key? key, this.message, this.onRetry, this.failure, this.customMessages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            _getErrorMessage,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        if (onRetry != null) ...[
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'))
        ]
      ],
    );
  }

  String get _getErrorMessage {
    String errorMessage = 'OOPS! Something went wrong';

    if (failure != null && failure is ServerFailure) {
      if (failure is ServerFailure) {
        if ((failure as ServerFailure?)!.errorCode ==
            ErrorCode.noInternetConnection) {
          errorMessage = 'No Internet Connection';
        } else if (customMessages != null && customMessages!.isNotEmpty) {
          errorMessage =
              customMessages![(failure as ServerFailure?)!.errorCode]!;
        }
      } else if (failure is LogicFailure) {
        if ((failure as LogicFailure?)!.message.isNotEmpty) {
          errorMessage = (failure as LogicFailure?)!.message;
        }
      }
    } else if (message != null) {
      errorMessage = message!;
    }
    return errorMessage;
  }
}
