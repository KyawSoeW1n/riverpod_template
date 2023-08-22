import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final photoScrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
});
