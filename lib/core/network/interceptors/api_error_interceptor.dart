import 'package:dio/dio.dart';

import '../errors/api_error.dart';
import '../errors/api_exception.dart';

class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiError = ApiError.fromDioException(err);
    handler.reject(
      err.copyWith(
        error: ApiException(apiError),
      ),
    );
  }
}
