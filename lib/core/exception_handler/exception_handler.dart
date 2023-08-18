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

extension ExceptionExtension<T> on Object {
  // Object may be BaseException or AsyncValue<> state
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
    Object? errorException = this;
    if (this is AsyncError) {
      errorException = (this as AsyncError).error;
    }
    if (errorException is NetworkException) {
      onNetworkException?.call((errorException).message);
      return;
    }

    if (errorException is NotFoundException && onNotFoundException != null) {
      onNotFoundException((errorException).message);
      return;
    }

    if (errorException is ServiceUnavailableException &&
        onServiceUnavailableException != null) {
      onServiceUnavailableException((errorException).message);
      return;
    }

    if (errorException is UnauthorizedException &&
        onUnauthorizedException != null) {
      onUnauthorizedException((errorException).message);
      return;
    }

    if (errorException is TimeoutException && onTimeoutException != null) {
      onTimeoutException((errorException).message);
      return;
    }

    if (errorException is JsonFormatException &&
        onJsonFormatException != null) {
      onJsonFormatException((errorException).message);
      return;
    }

    if (errorException is ApiException && onApiException != null) {
      onApiException((errorException).message);
      return;
    }

    if (errorException is AppException && onAppException != null) {
      onAppException((errorException).message);
      return;
    }

    if (errorException is BaseException && onCommonException != null) {
      onCommonException.call((errorException).message);
      return;
    }
  }
}
