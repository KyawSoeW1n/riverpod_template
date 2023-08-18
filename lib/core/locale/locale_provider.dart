import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/domain/change_language/change_language_usecase_impl.dart';

import '../../domain/get_language/get_language_usecase_impl.dart';
import 'locale_notifier.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(
    ref.read(changeLanguageUseCaseImpl),
    ref.read(getLanguageUseCaseImpl),
  );
});
