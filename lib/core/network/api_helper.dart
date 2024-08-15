import 'dart:convert'; // Add this import
import 'package:dio/dio.dart';
import 'package:itlala/core/network/api_const.dart';
import 'api_response.dart';
import 'retry_interceptor.dart';

enum Status { completed, loading, error, networkError }

class ApiHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConst.baseUrl,
      receiveDataWhenStatusError: true,
    ));
    dio.interceptors.add(RetryInterceptor(dio: dio));
  }

  static Future<ApiResponse> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': lang,
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(path, queryParameters: query);
      return ApiResponse.completed(jsonDecode(response.data)); // jsonDecode
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<ApiResponse> postData({
    required String path,
    String lang = 'ar',
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': lang,
      'Content-Type': 'application/json; charset=utf-8',
    };

    try {
      final response = await dio.post(path, queryParameters: query, data: data);
      return ApiResponse.completed(jsonDecode(response.data)); // jsonDecode
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<ApiResponse> putData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json; charset=utf-8',
    };

    try {
      final response = await dio.put(path, queryParameters: query, data: data);
      return ApiResponse.completed(jsonDecode(response.data)); // jsonDecode
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<ApiResponse> deleteData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.delete(path, queryParameters: query);
      return ApiResponse.completed(jsonDecode(response.data)); // jsonDecode
    } catch (e) {
      return _handleError(e);
    }
  }

  static ApiResponse _handleError(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return ApiResponse.networkError('Network timeout. Please try again.');
      } else if (e.type == DioExceptionType.badResponse) {
        return ApiResponse.error(
            'Received invalid status code: ${e.response?.statusCode}');
      } else if (e.type == DioExceptionType.cancel) {
        return ApiResponse.error('Request to API server was cancelled.');
      } else {
        return ApiResponse.error('Unexpected error occurred.');
      }
    } else {
      return ApiResponse.error('Unexpected error occurred.');
    }
  }
}
