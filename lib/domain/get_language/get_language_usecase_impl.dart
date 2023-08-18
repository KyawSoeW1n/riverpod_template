import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_source/local/app_database.dart';
import 'get_language_usecase.dart';

final getLanguageUseCaseImpl = Provider.autoDispose<GetLanguageUseCaseImpl>(
    (ref) => GetLanguageUseCaseImpl(ref.read(databaseService)));

class GetLanguageUseCaseImpl extends GetLanguageUseCase {
  final DatabaseService _databaseService;

  GetLanguageUseCaseImpl(this._databaseService);

  @override
  Locale getLocale() {
    return _databaseService.getLanguage();
  }
}
