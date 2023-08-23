import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';

import 'app_constants/app_route_configuration.dart';
import 'core/config/flavors.dart';
import 'core/config/flavour_manager.dart';
import 'core/locale/locale_provider.dart';
import 'core/locale/localization_helper.dart';
import 'core/resource/theme/theme_config.dart';
import 'data_source/local/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlavourManager().init(Flavor.production);
  await Hive.initFlutter();
  Hive.registerAdapter(CachePostAdapter());

  final dbService = DatabaseService();
  await dbService.initTheme();
  await dbService.initPostBox();
  await dbService.initLanguageBox();
  await dbService.initUserDataBox();
  runApp(
    ProviderScope(
      overrides: [
        databaseService.overrideWith((_) => dbService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isPlatformDark =
        PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkTheme : darkTheme;

    ///Use Theme Animation
    return ThemeProvider(
      initTheme: initTheme,
      duration: const Duration(milliseconds: 500),
      builder: (_, myTheme) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: myTheme,
          locale: locale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('fr', 'FR'),
          ],
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            LocalizationHelper.delegate
          ],
          routerConfig: goRouter,
        );
      },
    );
  }
}
