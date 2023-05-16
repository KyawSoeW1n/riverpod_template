import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/features/post/provider/post_provider.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

import '../../app_constants/app_routes.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postNotifierProvider);
    final photoProvider = ref.watch(photoNotifierProvider);
    return Scaffold(
      appBar: CommonAppBar(
        "Posts",
        actionList: [
          IconButton(
            onPressed: () => context.go("/${AppRoutes.setting}"),
            icon: const Icon(Icons.settings),
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
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(),
                        ),
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
    );
  }
}
