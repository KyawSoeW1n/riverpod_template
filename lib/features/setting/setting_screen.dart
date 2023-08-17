import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app_constants/app_routes.dart';
import '../../core/theme/theme_config.dart';
import '../../core/theme_provider.dart';
import '../../widget/common/common_app_bar.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeController).theme;
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: const CommonAppBar("Setting"),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ThemeSwitcher.withTheme(
                builder: (_, switcher, theme) {
                  return IconButton(
                    onPressed: () => switcher.changeTheme(
                      theme: theme.brightness == Brightness.light
                          ? darkTheme
                          : lightTheme,
                    ),
                    icon: const Icon(Icons.brightness_3, size: 25),
                  );
                },
              ),
            ),
            // ThemeSwitcher(
            //   clipper: const ThemeSwitcherCircleClipper(),
            //   builder: (context) {
            //     return IconButton(
            //       icon: const Icon(Icons.brightness_3),
            //       onPressed: () {
            //         ThemeSwitcher.of(context).changeTheme(
            //           theme: ThemeModelInheritedNotifier.of(context)
            //               .theme
            //               .brightness ==
            //               Brightness.light
            //               ? darkTheme
            //               : lightTheme,
            //         );
            //       },
            //     );
            //   },
            // ),
            // SwitchListTile.adaptive(
            //   title: const Text("Dark Mode"),
            //   value: (mode == 'dark') ? true : false,
            //   onChanged: (value) =>
            //       ref.watch(themeController.notifier).toggle(value),
            // ),
            InkWell(
              onTap: () => context.push("/${AppRoutes.favourite}"),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Favourites"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
