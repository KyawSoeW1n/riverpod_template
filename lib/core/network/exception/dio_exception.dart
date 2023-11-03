import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.type == DioExceptionType.badResponse) {
      message =
          _handleError(dioError.response!.statusCode, dioError.response!.data);
    } else if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.connectionError ||
        dioError.type == DioExceptionType.receiveTimeout) {
      message = "Receive timeout in connection with API server";
    } else if (dioError.type == DioExceptionType.sendTimeout) {
      message = "Send timeout in connection with API server";
    } else if (dioError.error is SocketException) {
      message = "No Internet Connection";
    } else {
      message = "Something went wrong";
    }
  }

  String? message;

  String _handleError(int? statusCode, dynamic error) {
    debugPrint("Status code $statusCode");
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthenticated';
      case 404:
        return "Not Found";
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
