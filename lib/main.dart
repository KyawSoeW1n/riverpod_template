import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/resource/theme.dart';

import 'core/theme_provider.dart';
import 'features/post_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? ThemeData.dark() : ThemeData.light();
    final themMode = ref.read(themeModeProvider);
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          themeMode: themMode,
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          home: const PostScreen(),
        );
      },
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
