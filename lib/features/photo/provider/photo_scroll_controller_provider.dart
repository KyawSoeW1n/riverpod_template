import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final photoScrollControllerProvider = Provider<ScrollController>((ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
});
