import 'package:dio/dio.dart';
import 'package:gitstaredrepogetter/core/interceptor/auth_intercetpor.dart';
import 'package:gitstaredrepogetter/core/interceptor/request_interceptor.dart';

class ApiService {
  final Dio _dio;
  ApiService() : _dio = Dio() {
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(AuthInterceptor());
  }
  Future<Response> get(String url,
      {dynamic data, Map<String, dynamic>? query, Options? options}) async {
    final response = await _dio.get(url,
        data: data, queryParameters: query, options: options);
    if ((response.statusCode ?? 400) < 400) {
      return response;
    } else {
      throw Exception("No data found");
    }
  }
}
