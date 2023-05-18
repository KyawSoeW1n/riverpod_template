import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/network/exception/api_exception.dart';
import 'package:riverpod_testing/core/network/exception/app_exception.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/core/network/exception/json_format_exception.dart';
import 'package:riverpod_testing/core/network/exception/network_exception.dart';
import 'package:riverpod_testing/core/network/exception/not_found_exception.dart';
import 'package:riverpod_testing/core/network/exception/service_unavailable_exception.dart';
import 'package:riverpod_testing/core/network/exception/timeout_exception.dart';
import 'package:riverpod_testing/core/network/exception/unauthorize_exception.dart';

extension AsyncErrorExtension<T> on AsyncValue<T> {
  void handleSpecificException({
    Function(String? message)? onNetworkException,
    Function(String? message)? onNotFoundException,
    Function(String? message)? onServiceUnavailableException,
    Function(String? message)? onUnauthorizedException,
    Function(String? message)? onTimeoutException,
    Function(String? message)? onJsonFormatException,
    Function(String? message)? onApiException,
    Function(String? message)? onAppException,
    Function(String? message)? onCommonException,
  }) {
    if (error is NetworkException) {
      onNetworkException?.call((error as BaseException).message);
      return;
    }

    if (error is NotFoundException && onNotFoundException != null) {
      onNotFoundException((error as NotFoundException).message);
      return;
    }

    if (error is ServiceUnavailableException &&
        onServiceUnavailableException != null) {
      onServiceUnavailableException(
          (error as ServiceUnavailableException).message);
      return;
    }

    if (error is UnauthorizedException && onUnauthorizedException != null) {
      onUnauthorizedException((error as UnauthorizedException).message);
      return;
    }

    if (error is TimeoutException && onTimeoutException != null) {
      onTimeoutException((error as TimeoutException).message);
      return;
    }

    if (error is JsonFormatException && onJsonFormatException != null) {
      onJsonFormatException((error as JsonFormatException).message);
      return;
    }

    if (error is ApiException && onApiException != null) {
      onApiException((error as ApiException).message);
      return;
    }

    if (error is AppException && onAppException != null) {
      onAppException((error as AppException).message);
      return;
    }

    if (onCommonException != null) {
      onCommonException.call((error as BaseException).message);
      return;
    }
  }
}
