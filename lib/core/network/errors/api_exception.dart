import 'api_error.dart';

class ApiException implements Exception {
  final ApiError error;

  const ApiException(this.error);

  @override
  String toString() {
    final code = error.statusCode != null ? ' (${error.statusCode})' : '';
    return 'ApiException$code: ${error.message}';
  }
}
