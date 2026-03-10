import 'package:dio/dio.dart';

import 'errors/api_error.dart';
import 'errors/api_exception.dart';
import 'interceptors/api_error_interceptor.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/network_log_interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient._(this._dio);

  factory ApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 15),
    Duration receiveTimeout = const Duration(seconds: 15),
    TokenProvider? tokenProvider,
    bool enableLogs = true,
    Map<String, dynamic>? defaultHeaders,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...?defaultHeaders,
      },
    );

    final dio = Dio(options)
      ..interceptors.add(NetworkLogInterceptor(enabled: enableLogs));

    if (tokenProvider != null) {
      dio.interceptors.add(AuthInterceptor(tokenProvider: tokenProvider));
    }

    dio.interceptors.add(ApiErrorInterceptor());

    return ApiClient._(dio);
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _execute(() {
      return _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    });
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _execute(() {
      return _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    });
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _execute(() {
      return _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    });
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _execute(() {
      return _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    });
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _execute(() {
      return _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    });
  }

  Future<Response<T>> _execute<T>(
      Future<Response<T>> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      final rawError = error.error;
      if (rawError is ApiException) {
        throw rawError;
      }

      throw ApiException(ApiError.fromDioException(error));
    }
  }
}
