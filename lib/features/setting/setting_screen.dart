import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/core/locale/locale_provider.dart';
import 'package:riverpod_testing/core/locale/support_locale.dart';
import 'package:riverpod_testing/core/resource/app_dimens.dart';
import 'package:riverpod_testing/widget/common/text_view_widget.dart';

import '../../app_constants/app_routes.dart';
import '../../core/locale/localization_helper.dart';
import '../../core/theme/theme_config.dart';
import '../../core/theme_provider.dart';
import '../../widget/common/common_app_bar.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeController).theme;
    final locale = ref.watch(localeProvider);
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: const CommonAppBar("Setting"),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ThemeSwitcher.withTheme(
                clipper: const ThemeSwitcherCircleClipper(),
                builder: (_, switcher, theme) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: AppDimens.margin16),
                          child: TextViewWidget(
                              '${LocalizationHelper.of(context)?.darkMode}'),
                        ),
                      ),
                      IconButton(
                        onPressed: () => switcher.changeTheme(
                          theme: theme.brightness == Brightness.light
                              ? darkTheme
                              : lightTheme,
                        ),
                        icon: const Icon(Icons.brightness_3),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.margin16,
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child:  TextViewWidget('Language'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const TextViewWidget('Eng'),
                            value: locale.languageCode,
                            groupValue: SupportedLocale.en.name,
                            onChanged: (value) {
                              ref
                                  .read(localeProvider.notifier)
                                  .changeLanguage(SupportedLocale.en);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const TextViewWidget('MY'),
                            value: locale.languageCode,
                            groupValue: SupportedLocale.fr.name,
                            onChanged: (value) {
                              ref
                                  .read(localeProvider.notifier)
                                  .changeLanguage(SupportedLocale.fr);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // child: Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //         onPressed: () {
              //           ref
              //               .read(localeProvider.notifier)
              //               .changeLanguage(SupportedLocale.en);
              //         },
              //         child: TextViewWidget("ENG"),
              //       ),
              //     ),
              //     SizedBox(
              //       width: AppDimens.margin16,
              //     ),
              //     Expanded(
              //       child: ElevatedButton(
              //         onPressed: () {
              //           ref
              //               .read(localeProvider.notifier)
              //               .changeLanguage(SupportedLocale.mm);
              //         },
              //         child: TextViewWidget("MM"),
              //       ),
              //     ),
              //   ],
              // ),
            ),
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
