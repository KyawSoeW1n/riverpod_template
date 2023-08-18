import '../../core/locale/support_locale.dart';

abstract class ChangeLanguageUseCase {
  Future<void> changeLanguage(SupportedLocale locale);
}
