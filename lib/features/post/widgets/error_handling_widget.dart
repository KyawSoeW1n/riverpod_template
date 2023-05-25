import 'package:flutter/material.dart';
import 'package:riverpod_testing/widget/error_handling/base_error_handling_view.dart';

class ErrorHandlingWidget extends BaseErrorHandlingView {
  final Object exception;

  const ErrorHandlingWidget({
    required this.exception,
    Key? key,
  }) : super(
    key: key,
    errorException: exception,
  );

  @override
  Widget noInterNetView(message) {
    return  Text(
      "Override View-> $message",
      style: TextStyle(color: Colors.red),
    );
  }

  @override
  Widget notFoundView(message) {
    return  Text(
      "Override View-> $message",
      style: TextStyle(color: Colors.blue),
    );
  }
}