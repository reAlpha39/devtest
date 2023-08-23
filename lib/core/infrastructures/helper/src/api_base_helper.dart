import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:devtest/core/core.dart';

@injectable
class ApiBaseHelper {
  final dio = Api.createDio();

  Future<dynamic> get({
    /// url
    required String url,

    /// query parameters
    Map<String, dynamic>? params,

    /// timeoutDuration in seconds
    int? timeout,
  }) async {
    try {
      final response = await dio
          .get(url, queryParameters: params)
          .timeout(Duration(seconds: timeout ?? 30));

      return _returnResponse(response, url: url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on DioException catch (e) {
      final dioError = e.message;
      final apiMessage = e.response?.data["message"];
      if (apiMessage != null) {
        throw SomethingDataException(apiMessage);
      }
      throw SomethingDataException(dioError);
    }
  }

  Future<dynamic> post({
    /// url
    required String url,

    /// data
    dynamic data,

    /// timeoutDuration in seconds
    int? timeout,
  }) async {
    try {
      final response = await dio
          .post(url, data: data)
          .timeout(Duration(seconds: timeout ?? 30));

      return _returnResponse(response, url: url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on DioException catch (e) {
      final dioError = e.message;
      final apiMessage = e.response?.data["message"];
      if (apiMessage != null) {
        throw SomethingDataException(apiMessage);
      }
      throw SomethingDataException(dioError);
    }
  }

  Future<dynamic> put({
    /// url
    required String url,

    /// data
    dynamic data,

    /// timeoutDuration in seconds
    int? timeout,
  }) async {
    try {
      final response = await dio
          .put(url, data: data)
          .timeout(Duration(seconds: timeout ?? 30));

      return _returnResponse(response, url: url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on DioException catch (e) {
      final dioError = e.message;
      final apiMessage = e.response?.data["message"];
      if (apiMessage != null) {
        throw SomethingDataException(apiMessage);
      }
      throw SomethingDataException(dioError);
    }
  }

  Future<dynamic> patch({
    /// url
    required String url,

    /// data
    dynamic data,

    /// timeoutDuration in seconds
    int? timeout,
  }) async {
    try {
      final response = await dio
          .patch(url, data: data)
          .timeout(Duration(seconds: timeout ?? 30));

      return _returnResponse(response, url: url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on DioException catch (e) {
      final dioError = e.message;
      final apiMessage = e.response?.data["message"];
      if (apiMessage != null) {
        throw SomethingDataException(apiMessage);
      }
      throw SomethingDataException(dioError);
    }
  }

  Future<dynamic> delete({
    /// url
    required String url,

    /// data
    dynamic data,

    /// query parameters
    Map<String, dynamic>? params,

    /// timeoutDuration in seconds
    int? timeout,
  }) async {
    try {
      final response = await dio
          .delete(url, data: data, queryParameters: params)
          .timeout(Duration(seconds: timeout ?? 30));

      return _returnResponse(response, url: url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Timeout');
    } on DioException catch (e) {
      final dioError = e.message;
      final apiMessage = e.response?.data["message"];
      if (apiMessage != null) {
        throw SomethingDataException(apiMessage);
      }
      throw SomethingDataException(dioError);
    }
  }
}

dynamic _returnResponse(
  Response response, {
  String? url,
}) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 201:
      return response.data;
    case 401:
      throw UnauthorizedException(response.data["error"]);
    default:
      throw SomethingDataException('${response.data["message"]}');
  }
}
