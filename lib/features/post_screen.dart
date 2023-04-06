import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_testing/features/provider/post_provider.dart';

import '../network/response/test_response.dart';
import 'notifier/post_notifier.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(postNotifierProvider);
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
        body: provider.when(
          loading: () => Center(
            child: const CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (err, stack) => Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(postNotifierProvider.notifier).getPosts();
              },
              child: Text("Get Details"),
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
        ));
  }
}
