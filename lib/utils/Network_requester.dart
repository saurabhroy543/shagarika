import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shagarika/utils/constants.dart';
import 'package:shagarika/utils/app_utils.dart';
import 'package:shagarika/utils/exception_handler.dart';
import 'package:shagarika/utils/storage.dart';

class NetworkRequester {
  Dio? _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Timeouts.connectTimeout,
      receiveTimeout: Timeouts.receiveTimeout,
      baseUrl: Base.baseurl,
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );
    if (AppUtils.isLoggedIn()) {
      dioOptions.headers['Authorization'] = 'Token ${Storage.token}';
    }

    _dio = Dio(dioOptions);

    _dio?.interceptors.clear();

    _dio?.interceptors.addAll([
      LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          logPrint: printLog)
    ]);
  }

  static printLog(Object object) {
    log(object.toString());
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio?.get(path, queryParameters: query);
      return response?.data;
    } on DioError catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioError catch (dioError) {
      return ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      // AppLogger.print(error);
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postList({
    required String path,
    Map<String, dynamic>? query,
    List<Map<String, dynamic>>? data,
  }) async {
    try {
      final response =
      await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioError catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio?.put(path, queryParameters: query, data: data);
      return response?.data;
    } on DioError catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postFormData({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      final response =
      await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioError catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }
}
