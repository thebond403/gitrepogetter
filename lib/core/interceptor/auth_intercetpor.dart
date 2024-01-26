import 'package:dio/dio.dart';
import 'package:gitstaredrepogetter/core/environment/envirionment_config.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = EnvironmentConfig.accessToken;
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
