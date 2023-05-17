import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../data_source/network/error_handlers.dart';
import 'dio_provider/dio_provider.dart';
import 'exception/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      // if (response.statusCode != HttpStatus.ok ||
      //     (response.data as Map<String, dynamic>)['statusCode'] !=
      //         HttpStatus.ok) {
      //   // TODO
      // }
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      if (kDebugMode) {
        debugPrint(
            "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      }
      throw exception;
    } catch (error) {
      if (kDebugMode) {
        debugPrint("Generic error: >>>>>>> $error");
      }

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
