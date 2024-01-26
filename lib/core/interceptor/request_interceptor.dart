import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gitstaredrepogetter/core/extensions/extensions.dart';
import 'package:gitstaredrepogetter/core/toaster/app_toaster.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("Request path ${options.path}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    inspect(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    dynamic errors = err.error?.toString() ?? "";
    final errorMessage = err.message;
    if (errors is List<dynamic>) {
      errors = errors.join("\n");
    } else {
      errors = errors?.toString();
    }

    if (response != null) {
      final statusCode = response.statusCode;
      if ((statusCode ?? 0) > 400) {
        _showErrorMessage("Error with status code ${statusCode ?? 0}",
            errors: errors, statusCode: statusCode);
      }
    }
    throw Exception(errorMessage ?? "Something went wrong!");
  }

  _showErrorMessage(String msg, {String? errors, int? statusCode}) {
    var title = statusCode == null ? null : '$statusCode error!';
    if (!errors.isNullEmptyOrWhiteSpace) {
      msg = "$msg \nError : $errors";
    }
    Toaster.showError(msg, title: title ?? "");
  }
}
