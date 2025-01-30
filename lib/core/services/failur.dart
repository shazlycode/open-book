import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage});

  factory ServerError.fromDioException(DioException dioException) {
    switch (dioException) {
      case DioException.connectionTimeout:
        return ServerError(errorMessage: "Connection Timeout");
      case DioException.sendTimeout:
        return ServerError(errorMessage: "Send Timeout");
      case DioException.receiveTimeout:
        return ServerError(errorMessage: "Receive Timeout");
      case DioException.badCertificate:
        return ServerError(errorMessage: "Bad Certificate");
      case DioException.badResponse:
        return ServerError.fromBadResponse(dioException.response!.statusCode!,
            dioException.response!.statusMessage!);
      case DioException.requestCancelled:
        return ServerError(errorMessage: "Request Cancelled");
      case DioException.connectionError:
        return ServerError(errorMessage: "Connection Error");
      default:
        return ServerError(errorMessage: "Unknown Error");
    }
  }

  factory ServerError.fromBadResponse(int statusCode, String responseMessage) {
    switch (statusCode) {
      case 400:
        return ServerError(errorMessage: "Bad Request");
      case 401:
        return ServerError(errorMessage: "Unauthorized");
      case 403:
        return ServerError(errorMessage: "Forbidden");
      case 404:
        return ServerError(errorMessage: "Not Found");
      case 500:
        return ServerError(errorMessage: "Internal Server Error");
      case 502:
        return ServerError(errorMessage: "Bad Gateway");
      case 503:
        return ServerError(errorMessage: "Service Unavailable");
      case 504:
        return ServerError(errorMessage: "Gateway Timeout");
      default:
        return ServerError(errorMessage: responseMessage);
    }
  }
}
