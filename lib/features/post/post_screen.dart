import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/features/post/provider/post_provider.dart';
import 'package:riverpod_testing/features/post/widgets/error_handling_widget.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';
import 'package:riverpod_testing/widget/error_handling/base_error_handling_view.dart';
import 'package:riverpod_testing/widget/posts/post_item.dart';

import '../../app_constants/app_routes.dart';
import '../../core/base/base_view.dart';

class PostScreen extends BaseView {
  PostScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CommonAppBar(
      "Posts",
      actionList: [
        IconButton(
          onPressed: () => context.go("/${AppRoutes.setting}"),
          icon: const Icon(Icons.settings),
        ),
        Consumer(
          // 2. specify the builder and obtain a WidgetRef
          builder: (_, WidgetRef ref, __) {
            // 3. use ref.watch() to get the value of the provider
            // final photoProvider = ref.watch(postNotifierProvider);
            return IconButton(
              onPressed: () => ref
                  .read(photoNotifierProvider.notifier)
                  .getPhotoList(),
              icon: const Icon(Icons.refresh),
            );
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postNotifierProvider);
    final photoProvider = ref.watch(photoNotifierProvider);
    final getFavouritePostsProvider = ref.watch(favouritePostsStreamProvider);
    final allPhotos = photoProvider.maybeWhen(
      data: (photos) => photos,
      orElse: () => [],
    );
    return Column(
      children: [
        getFavouritePostsProvider.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (err, stack) => Container(),
          data: (config) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Favourite Post Count"),
                  Text("${config.length}"),
                ],
              ),
            );
          },
        ),
        Expanded(
          flex: 1,
          child: photoProvider.when(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
            error: (err, stack) => ErrorHandlingWidget(exception: err),
            data: (config) {
              return ListView.builder(
                itemCount: allPhotos.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: allPhotos[index],
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
                  return PostItem(
                    index,
                    config[index].title,
                    ref.read(postNotifierProvider.notifier).addFavouritePost,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}