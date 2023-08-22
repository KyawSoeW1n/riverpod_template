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
import '../../core/resource/theme/theme_config.dart';
import '../../widget/common/common_app_bar.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            '${LocalizationHelper.of(context)?.darkMode}',
                          ),
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
                    child: TextViewWidget('Language'),
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
            ),
            InkWell(
              onTap: () => context.push("/${AppRoutes.favourite}"),
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.margin16),
                child: TextViewWidget(
                  '${LocalizationHelper.of(context)?.favourites}',
                ),
              ),
            ),
            InkWell(
              onTap: () => context.push("/${AppRoutes.user}"),
              child: const Padding(
                padding: EdgeInsets.all(AppDimens.margin16),
                child: TextViewWidget(
                  'User',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
