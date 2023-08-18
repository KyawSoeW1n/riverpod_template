import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/network/exception/api_exception.dart';
import '../../core/network/exception/app_exception.dart';
import '../../core/network/exception/not_found_exception.dart';
import '../../core/network/exception/service_unavailable_exception.dart';

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.unknown:
      return AppException(message: dioError.message ?? "");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioErrorType.badCertificate:
      return AppException(message: "Bad Certificate");
    case DioErrorType.connectionError:
      return TimeoutException("Receive timeout in connection with API server");
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? serverMessage;
  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    } else if (dioError.response?.data["statusCode"] == 40101 ||
        dioError.response?.data["statusCode"] == 40102 ||
        dioError.response?.data["statusCode"] == 401) {
      // Get.find<CacheManager>().clearAllData();
      // Get.offAllNamed(
      //   AppRoutes.loginScreen,
      // );
    }
    serverMessage = dioError.response?.data["message"];
  } catch (e) {
    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(
          serverMessage ?? "Request URL Not Found", "Not Found");
    default:
      return ApiException(
        httpCode: statusCode,
        status: "Not found",
        message: serverMessage ?? "",
      );
  }
}
