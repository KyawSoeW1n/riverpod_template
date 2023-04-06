import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/features/notifier/post_notifier.dart';

import '../service/post_service.dart';

final postServiceProvider = Provider<PostService>((ref) => PostService());

final postNotifierProvider = StateNotifierProvider<PostNotifier, AsyncValue<List<String>>>((ref){
  PostService postService = ref.read(postServiceProvider);
  return PostNotifier(postService);
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});