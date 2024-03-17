import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/locale/support_locale.dart';
import 'package:riverpod_testing/domain/get_language/get_language_usecase_impl.dart';

import '../../domain/change_language/change_language_usecase.dart';
import '../../domain/change_language/change_language_usecase_impl.dart';
import '../../domain/get_language/get_language_usecase.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  final ChangeLanguageUseCase _changeLanguageUseCase;
  final GetLanguageUseCase _getLanguageUseCase;

  LocaleNotifier(this._changeLanguageUseCase, this._getLanguageUseCase)
      : super(const Locale('en')) {
    onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      _changeLanguageUseCase.changeLanguage(locale);
      state = Locale(locale.languageCode);
    } catch (error) {
      state = const Locale('en');
    }
  }

  void onAppStart() {
    try {
      final locale = _getLanguageUseCase.getLocale();
      state = locale;
    } catch (error) {
      state = const Locale('en');
    }
  }
}
