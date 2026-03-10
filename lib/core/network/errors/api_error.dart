import 'package:dio/dio.dart';

/// Categorias de error para poder tratar escenarios de red de forma uniforme.
enum ApiErrorType {
  requestCancelled,
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  unprocessableEntity,
  serverError,
  noInternet,
  invalidResponse,
  unknown,
}

class ApiError {
  final String message;
  final int? statusCode;
  final ApiErrorType type;
  final dynamic data;

  const ApiError({
    required this.message,
    required this.type,
    this.statusCode,
    this.data,
  });

  factory ApiError.fromDioException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(
          message: 'La solicitud fue cancelada.',
          type: ApiErrorType.requestCancelled,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.connectionTimeout:
        return ApiError(
          message: 'Tiempo de espera agotado al conectar.',
          type: ApiErrorType.connectionTimeout,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.sendTimeout:
        return ApiError(
          message: 'Tiempo de espera agotado al enviar datos.',
          type: ApiErrorType.sendTimeout,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.receiveTimeout:
        return ApiError(
          message: 'Tiempo de espera agotado al recibir datos.',
          type: ApiErrorType.receiveTimeout,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.badCertificate:
        return ApiError(
          message: 'Certificado de seguridad invalido.',
          type: ApiErrorType.badCertificate,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.connectionError:
        return ApiError(
          message: 'No se pudo establecer conexion a internet.',
          type: ApiErrorType.noInternet,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.badResponse:
        return _fromHttpStatus(
          statusCode: statusCode,
          data: data,
          fallbackMessage:
              _extractMessage(data) ?? 'Respuesta invalida del servidor.',
        );
      case DioExceptionType.unknown:
        return ApiError(
          message: _extractMessage(data) ?? 'Ocurrio un error inesperado.',
          type: ApiErrorType.unknown,
          statusCode: statusCode,
          data: data,
        );
    }
  }

  static ApiError _fromHttpStatus({
    required int? statusCode,
    required dynamic data,
    required String fallbackMessage,
  }) {
    final message = _extractMessage(data) ?? fallbackMessage;

    switch (statusCode) {
      case 401:
        return ApiError(
          message: message,
          type: ApiErrorType.unauthorized,
          statusCode: statusCode,
          data: data,
        );
      case 403:
        return ApiError(
          message: message,
          type: ApiErrorType.forbidden,
          statusCode: statusCode,
          data: data,
        );
      case 404:
        return ApiError(
          message: message,
          type: ApiErrorType.notFound,
          statusCode: statusCode,
          data: data,
        );
      case 409:
        return ApiError(
          message: message,
          type: ApiErrorType.conflict,
          statusCode: statusCode,
          data: data,
        );
      case 422:
        return ApiError(
          message: message,
          type: ApiErrorType.unprocessableEntity,
          statusCode: statusCode,
          data: data,
        );
      default:
        if (statusCode != null && statusCode >= 500) {
          return ApiError(
            message: message,
            type: ApiErrorType.serverError,
            statusCode: statusCode,
            data: data,
          );
        }

        return ApiError(
          message: message,
          type: ApiErrorType.invalidResponse,
          statusCode: statusCode,
          data: data,
        );
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'] ?? data['detail'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    if (data is String && data.trim().isNotEmpty) {
      return data;
    }

    return null;
  }
}
