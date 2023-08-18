import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/locale/support_locale.dart';
import 'package:riverpod_testing/domain/get_language/get_language_usecase_impl.dart';

import '../../domain/change_language/change_language_usecase_impl.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  final ChangeLanguageUseCaseImpl _changeLanguageUseCaseImpl;
  final GetLanguageUseCaseImpl _getLanguageUseCaseImpl;

  LocaleNotifier(this._changeLanguageUseCaseImpl, this._getLanguageUseCaseImpl)
      : super(const Locale('en')) {
    onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      _changeLanguageUseCaseImpl.changeLanguage(locale);
      state = Locale(locale.languageCode);
    } catch (error) {
      state = const Locale('en');
    }
  }

  void onAppStart() {
    try {
      final locale = _getLanguageUseCaseImpl.getLocale();
      state = locale;
    } catch (error) {
      state = const Locale('en');
    }
  }
}
