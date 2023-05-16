import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme_provider.dart';
import '../../widget/common/common_app_bar.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeController).theme;
    return Scaffold(
      appBar: const CommonAppBar("Setting"),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text("Dark Mode"),
            value: (mode == 'dark') ? true : false,
            onChanged: (value) =>
                ref.watch(themeController.notifier).toggle(value),
          )
        ],
      ),
    );
  }
}
