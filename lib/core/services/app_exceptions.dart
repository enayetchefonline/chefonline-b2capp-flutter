// lib/core/exceptions/app_exception.dart
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final String? details;

  AppException(this.message, {this.details});

  @override
  String toString() => 'AppException: $message ${details ?? ""}';

  factory AppException.fromDio(DioException error) {

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return AppException("HTTP Server Timeout", details:error.type.name);
      case DioExceptionType.sendTimeout:
        return AppException("Send timeout", details: error.message);
      case DioExceptionType.receiveTimeout:
        return AppException("Receive timeout", details: error.message);
      case DioExceptionType.badCertificate:
        return AppException("Bad certificate", details: error.message);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final msg = _mapStatusCodeToMessage(statusCode);
        return AppException(msg, details: error.response?.data['message']);
      case DioExceptionType.cancel:
        return AppException("Request cancelled", details: error.message);
      case DioExceptionType.connectionError:
        return AppException("No internet connection", details: error.message);
      case DioExceptionType.unknown:
      default:
        return AppException("Unknown error", details: error.message);
    }
  }

  factory AppException.from(Object error) {
    if (error is DioException) {
      return AppException.fromDio(error);
    } else if (error is SocketException) {
      return AppException("No internet connection", details: error.message);
    } else if (error is TimeoutException) {
      return AppException("Request timed out", details: error.toString());
    } else if (error is FormatException) {
      return AppException("Data format error", details: error.toString());
    } else if (error is AppException) {
      return error;
    } else {
      return AppException("Unexpected error", details: error.toString());
    }
  }

  static String _mapStatusCodeToMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 422:
        return "Unprocessable Entity";
      case 500:
        return "Internal server error";
      case 503:
        return "Service unavailable";
      default:
        return "Unexpected server response";
    }
  }
}
