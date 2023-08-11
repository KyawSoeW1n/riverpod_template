import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/features/post/provider/post_provider.dart';
import 'package:riverpod_testing/features/post/widgets/error_handling_widget.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

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
              onPressed: () =>
                  ref.read(photoNotifierProvider.notifier).getPhotoList(),
              icon: const Icon(Icons.refresh),
            );
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final refreshController = RefreshController();
    final postProvider = ref.watch(postNotifierProvider);
    final photoProvider = ref.watch(photoNotifierProvider);
    final getFavouritePostsProvider = ref.watch(favouritePostsStreamProvider);
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
          child: Consumer(
            builder: (context, ref, _) {
              return SmartRefresher(
                onRefresh: () =>
                    ref.read(photoNotifierProvider.notifier).getPhotoList(),
                // enablePullUp: true,
                enablePullDown: true,
                // onLoading: () =>
                //     ref.read(photoNotifierProvider.notifier).getPhotoList(),
                controller: refreshController,
                child: photoProvider.maybeWhen(
                  success: (content) => ListView.builder(
                    itemCount: content.length,
                    itemBuilder: (context, index) {
                      return Text(content[index]);
                    },
                  ),
                  error: (e) => ErrorHandlingWidget(exception: e),
                  orElse: () => const SizedBox(),
                ),
              );
            },
          ),
        ),
        // Expanded(
        //   child: Consumer(
        //     builder: (context, ref, _) {
        //       return postProvider.maybeWhen(
        //         success: (content) => ListView.builder(
        //           itemCount: content.length,
        //           itemBuilder: (context, index) {
        //             return PostItem(
        //               index,
        //               content[index].title,
        //               ref.read(postNotifierProvider.notifier).addFavouritePost,
        //             );
        //           },
        //         ),
        //         error: (e) => ErrorHandlingWidget(exception: e),
        //         orElse: () => const Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
