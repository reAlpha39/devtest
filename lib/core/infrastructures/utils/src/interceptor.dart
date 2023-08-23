import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.followRedirects = false;
    return handler.next(options);
  }
}
