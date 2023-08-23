import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/locale/support_locale.dart';
import '../../data_source/local/app_database.dart';
import 'change_language_usecase.dart';

final changeLanguageUseCaseImpl =
    Provider.autoDispose<ChangeLanguageUseCaseImpl>(
        (ref) => ChangeLanguageUseCaseImpl(ref.read(databaseService)));

class ChangeLanguageUseCaseImpl extends ChangeLanguageUseCase {
  final DatabaseService _databaseService;

  ChangeLanguageUseCaseImpl(this._databaseService);

  @override
  Future<void> changeLanguage(SupportedLocale locale) async {
    await _databaseService.saveLanguage(locale);
  }
}
