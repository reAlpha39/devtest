import 'package:devtest/core/core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorHelper {
  static handleError(error, {StackTrace? stack}) async {

    if (error is BadRequestException) {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${error.message}'),
        ),
      );
    } else if (error is FetchDataException) {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${error.message}'),
        ),
      );
    } else if (error is ApiNotRespondingException) {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${error.message}'),
        ),
      );
    } else if (error is UnauthorizedException) {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${error.message}'),
        ),
      );
    } else if (error is SomethingDataException) {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${error.message}'),
        ),
      );
    } else {
      return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text("$error"),
        ),
      );
    }
  }
}
