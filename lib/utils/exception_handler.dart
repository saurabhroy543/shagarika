import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shagarika/utils/constants.dart';

class APIExceptionString implements Exception {
  String? detail;

  APIExceptionString({this.detail});

  APIExceptionString.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    return data;
  }
}

class ExceptionHandler {
  static handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.other:
        EasyLoading.showError(ErrorMessages.noInternet);
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        EasyLoading.showError(ErrorMessages.connectionTimeout);
        break;
      case DioErrorType.response:
        if (error.response != null && error.response?.data != null) {
          try {
            var apiException =
            APIExceptionString.fromJson(error.response?.data);
            EasyLoading.showError(
                apiException.detail ?? ErrorMessages.networkGeneral);
          } catch (e) {
            EasyLoading.showError(ErrorMessages.networkGeneral);
          }
        }
        break;
      default:
        EasyLoading.showError(ErrorMessages.networkGeneral);
        break;
    }
  }

  static handleError(Exception error) {
    EasyLoading.showError(ErrorMessages.networkGeneral);
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}


class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}