import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/features/provider/post_provider.dart';

import '../core/theme_provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postNotifierProvider);
    final photoProvider = ref.watch(photoNotifierProvider);
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                final theme = ref.watch(themeModeProvider);
                return ThemeSwitcher(
                  builder: (context) => IconButton(
                    onPressed: () {
                      final brightness = ThemeModelInheritedNotifier.of(context)
                          .theme
                          .brightness;
                      ThemeSwitcher.of(context).changeTheme(
                        theme: brightness == Brightness.light
                            ? ThemeData.dark()
                            : ThemeData.light(),
                        isReversed:
                            brightness == Brightness.dark ? true : false,
                      );
                    },
                    icon: Icon(theme == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: photoProvider.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
                error: (err, stack) => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(photoNotifierProvider.notifier).getPhotoList();
                    },
                    child: const Text("Try Again"),
                  ),
                ),
                data: (config) {
                  return ListView.builder(
                    itemCount: config.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: config[index],
                        placeholder: (context, url) => const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: postProvider.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
                error: (err, stack) => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(postNotifierProvider.notifier).getPostList();
                    },
                    child: const Text("Try Again"),
                  ),
                ),
                data: (config) {
                  return ListView.builder(
                    itemCount: config.length,
                    itemBuilder: (context, index) {
                      return Text(
                        config[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
