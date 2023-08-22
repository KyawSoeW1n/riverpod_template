import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_testing/core/network/exception/network_exception.dart';
import 'package:riverpod_testing/core/utils/network_util.dart';

import '../../data_source/network/error_handlers.dart';
import 'dio_provider/dio_provider.dart';
import 'exception/app_exception.dart';
import 'exception/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(
      Future<Response<T>> Function() apiProvider) async {
    bool isNetworkAvailable = await NetworkUtil.isNetworkAvailable();
    if (isNetworkAvailable == false) {
      throw NetworkException("No Internet Connection");
    }

    try {
      Response<T> response = await apiProvider();
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      if (kDebugMode) {
        log("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      }
      throw exception;
    } catch (error) {
      if (kDebugMode) {
        log("Generic error: >>>>>>> $error");
      }

      if (error is BaseException) {
        rethrow;
      }

      throw AppException(message: "$error");
    }
  }
}
