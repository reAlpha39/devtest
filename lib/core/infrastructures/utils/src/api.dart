import 'dart:io';

import 'package:devtest/core/core.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: BuildConfig.get().baseUrl,
        contentType: Headers.jsonContentType,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    // add certificate callback
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.httpClientAdapter;

    dio.interceptors.addAll({
      AppInterceptor(dio),
      if (kDebugMode) ...[
        PrettyDioLogger(requestHeader: true, requestBody: true),
      ],
    });

    return dio;
  }
}
