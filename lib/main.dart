import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_testing/core/enum_collection/theme_type.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:riverpod_testing/resource/theme.dart';

import 'app_constants/app_route_configuration.dart';
import 'core/theme_provider.dart';
import 'data_source/local/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavouritePostAdapter());
  final dbService = DatabaseService();
  await dbService.initTheme();
  await dbService.initFavouriteBox();
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themMode = ref.watch(themeController);
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: themMode.theme == ThemeType.light.name
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      routerConfig: goRouter,
      // themeMode: themMode,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: lightColorScheme,
    //   ),
    //   darkTheme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: darkColorScheme,
    //   ),
    //   themeMode: themMode,
    //   // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   home: PostScreen(),
    // );
  }
}
