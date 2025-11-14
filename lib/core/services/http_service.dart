import 'dart:convert';

import 'package:chefonline/core/config/app_urls.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'app_exceptions.dart';

class HttpClientService {
  final Dio _dio;
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, printTime: false, colors: true),
  );


  HttpClientService._internal()
      : _dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final buffer = StringBuffer();
          buffer.writeln('┌───── 📤 HTTP REQUEST ─────');
          buffer.writeln('│ ➡️ ${options.method.toUpperCase()} ${options.uri}');
          buffer.writeln('│ 🧾 Headers:');
          options.headers.forEach((k, v) => buffer.writeln('│    $k: $v'));
          if (options.data != null) {
            final prettyBody = _prettyJson(options.data);
            buffer.writeln('│ 📝 Body:\n${_indent(prettyBody)}');
          }
          buffer.writeln('└──────────────────────────');
          _logger.i(buffer.toString());

          handler.next(options); // Proceed with the request
        },

        onResponse: (response, handler) {
          final buffer = StringBuffer();
          buffer.writeln('┌───── ✅ HTTP RESPONSE ─────');
          buffer.writeln('│ ${response.statusCode} ${response.requestOptions.uri}');
          final prettyResponse = _prettyJson(response.data);
          buffer.writeln('│ 📦 Full Response:\n${_indent(prettyResponse)}');
          buffer.writeln('└────────────────────────────');
          _logger.i(buffer.toString());
          handler.next(response);
        },

        onError: (e, handler) async {
          final buffer = StringBuffer();
          buffer.writeln('┌───── ❌ HTTP ERROR ─────');
          buffer.writeln('│ ${e.requestOptions.method} ${e.requestOptions.uri}');
          buffer.writeln('│ Status Code: ${e.response?.statusCode ?? "Unknown"}');
          buffer.writeln('│ Message: ${e.message}');
          if (e.response?.data != null) {
            final errorBody = _prettyJson(e.response!.data);
            buffer.writeln('│ ❗ Error Body:\n${_indent(errorBody)}');
          }
          buffer.writeln('└──────────────────────────');
          _logger.e(buffer.toString());

          // Just forward the error without token refresh logic
          handler.next(e);
        },
      ),
    );
  }

  static final HttpClientService _instance = HttpClientService._internal();

  static HttpClientService get instance => _instance;

  static String _prettyJson(dynamic data) {
    try {
      if (data is String) {
        return const JsonEncoder.withIndent('  ').convert(jsonDecode(data));
      }
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  static String _indent(String text) {
    return text.split('\n').map((line) => '│   $line').join('\n');
  }

  bool _isFullUrl(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  Uri _buildUri(String path, [Map<String, dynamic>? queryParams]) {
    return _isFullUrl(path)
        ? Uri.parse(path)
        : Uri.parse('${_dio.options.baseUrl}$path');
  }

  Future<Response> get(String path, {dynamic data,Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams,data: data);
    } catch (e) {
      throw AppException.from(e);
    }
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.post(path, data: data, queryParameters: queryParameters);
    } catch (e) {
      throw AppException.from(e);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      throw AppException.from(e);
    }
  }

  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await _dio.delete(path, data: data);
    } catch (e) {
      throw AppException.from(e);
    }
  }



}
