import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(
    BaseOptions(
      baseUrl: _getBaseUrl(),
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  static String _getBaseUrl() {
    if (!kIsWeb && Platform.isAndroid) {
      return 'http://10.0.2.2:8081/api/v1'; // Dirección de retorno del host en emuladores Android
    }
    return 'http://localhost:8081/api/v1';
  }

  Dio get dio => _dio;

  // Helper method for GET requests with clean error handling
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      
      // Checking for errors embedded in the API response format
      if (response.data != null && response.data is Map) {
        final errors = response.data['errors'];
        if (errors != null && errors.isNotEmpty) {
          throw DioException(
            requestOptions: response.requestOptions,
            response: response,
            message: errors.toString(),
            type: DioExceptionType.badResponse,
          );
        }
      }
      return response;
    } on DioException {
      // Re-throw or format error as needed
      rethrow;
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
