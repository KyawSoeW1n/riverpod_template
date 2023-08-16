import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final postScrollControllerProvider = Provider<ScrollController>((ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
});
