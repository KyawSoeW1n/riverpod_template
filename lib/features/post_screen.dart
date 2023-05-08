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
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final theme = ref.watch(themeModeProvider);
              return IconButton(
                onPressed: () {
                  ref.read(themeModeProvider.notifier).state =
                      theme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                icon: Icon(theme == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode),
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
                    debugPrint(">>>>>>> ${config[index]}");
                    return Text(config[index]);
                    // return Image.network(config[index]);
                    // return CachedNetworkImage(
                    //   imageUrl: config[index],
                    //   placeholder: (context, url) => CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // );
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
    );
  }
}
