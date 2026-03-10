import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkLogInterceptor extends Interceptor {
  final bool enabled;

  NetworkLogInterceptor({this.enabled = kDebugMode});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enabled) {
      debugPrint('[REQ] ${options.method} ${options.uri}');
      if (options.headers.isNotEmpty) {
        debugPrint('[REQ_HEADERS] ${options.headers}');
      }
      if (options.data != null) {
        debugPrint('[REQ_BODY] ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enabled) {
      debugPrint(
        '[RES] ${response.requestOptions.method} ${response.requestOptions.uri} -> ${response.statusCode}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enabled) {
      debugPrint(
        '[ERR] ${err.requestOptions.method} ${err.requestOptions.uri} -> ${err.message}',
      );
    }
    handler.next(err);
  }
}
