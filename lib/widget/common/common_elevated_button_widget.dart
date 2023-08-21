import 'package:flutter/material.dart';
import 'package:riverpod_testing/widget/common/text_view_widget.dart';

class CommonElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CommonElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextViewWidget(text),
    );
  }
}
