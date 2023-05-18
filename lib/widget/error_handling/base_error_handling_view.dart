import 'package:flutter/material.dart';
import 'package:riverpod_testing/core/network/exception/api_exception.dart';
import 'package:riverpod_testing/core/network/exception/app_exception.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/core/network/exception/json_format_exception.dart';
import 'package:riverpod_testing/core/network/exception/network_exception.dart';
import 'package:riverpod_testing/core/network/exception/not_found_exception.dart';
import 'package:riverpod_testing/core/network/exception/service_unavailable_exception.dart';
import 'package:riverpod_testing/core/network/exception/timeout_exception.dart';
import 'package:riverpod_testing/core/network/exception/unauthorize_exception.dart';

class BaseErrorHandlingView extends StatelessWidget {
  final Object errorException;

  const BaseErrorHandlingView({
    super.key,
    required this.errorException,
  });

  Widget noInterNetView(String message) => Text("Common $message");

  Widget notFoundView(String message) => Text("Common $message");

  Widget commonErrorView(String message) => Text("Common $message");

  @override
  Widget build(BuildContext context) {
    if (errorException is NetworkException) {
      return noInterNetView((errorException as BaseException).message ?? '');
    }

    if (errorException is NotFoundException) {
      return notFoundView((errorException as NotFoundException).message ?? '');
    }

    if (errorException is ServiceUnavailableException) {
      return commonErrorView(
          (errorException as ServiceUnavailableException).message ?? '');
    }

    if (errorException is UnauthorizedException) {
      return commonErrorView(
          (errorException as UnauthorizedException).message ?? '');
    }

    if (errorException is TimeoutException) {
      return commonErrorView(
          (errorException as TimeoutException).message ?? '');
    }

    if (errorException is JsonFormatException) {
      return commonErrorView(
          (errorException as JsonFormatException).message ?? '');
    }

    if (errorException is ApiException) {
      return commonErrorView((errorException as ApiException).message ?? '');
    }

    if (errorException is AppException) {
      return commonErrorView((errorException as ApiException).message ?? '');
    }

    return commonErrorView((errorException as BaseException).message ?? '');
  }
}
