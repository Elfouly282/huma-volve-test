import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          'Connection timeout with the server, please try again',
        );
      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          'Send timeout with the server, please try again',
        );
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          'Receive timeout with the server, please try again',
        );
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate, please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request was cancelled, please try again');
      case DioExceptionType.connectionError:
        return const ServerFailure(
          'No internet connection, please check and try again',
        );
      case DioExceptionType.unknown:
        return const ServerFailure('Something went wrong, please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 404 ||
        statusCode == 422) {
      try {
        final data = response as Map<String, dynamic>;

        final errors = data['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return ServerFailure(firstError.first.toString());
          }
        }

        return ServerFailure(data['message']?.toString() ?? 'Request failed');
      } catch (_) {
        return const ServerFailure('Request failed, please try again');
      }
    } else if (statusCode == 500) {
      return const ServerFailure('Internal server error, please try later');
    } else {
      return const ServerFailure('Something went wrong, please try again');
    }
  }
}
