import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/features/post/widgets/cache_post_list_widget.dart';
import 'package:riverpod_testing/features/post/widgets/error_handling_widget.dart';
import 'package:riverpod_testing/features/post/widgets/favourite_post_item_count_widget.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';
import 'package:riverpod_testing/widget/common/loading_widget.dart';

import '../../app_constants/app_routes.dart';
import '../../core/base/base_view.dart';
import '../../data_source/local/app_database.dart';
import 'notifier/post_notifier.dart';

class PostScreen extends BaseView {
  PostScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CommonAppBar(
      "Posts",
      actionList: [
        IconButton(
          onPressed: () => context.go("/${AppRoutes.photo}"),
          icon: const Icon(Icons.account_tree),
        ),
        IconButton(
          onPressed: () => context.go("/${AppRoutes.setting}"),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final refreshController = RefreshController();

    final postProvider = ref.watch(postNotifierProvider);

    final postListStreamProvider = ref.watch(postsStreamProvider);

    final favouritePostListStreamProvider =
        ref.watch(favouritePostsStreamProvider);
    return Column(
      children: [
        favouritePostListStreamProvider.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (err, stack) => const SizedBox(),
          data: (config) {
            return FavouritePostItemCountWidget(config);
          },
        ),
        Expanded(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () =>
                ref.read(postNotifierProvider.notifier).getPostList(),
            child: postProvider.maybeWhen(
              loading: () => const LoadingWidget(),
              success: (data) => const CachePostListWidget(),
              error: (e) => postListStreamProvider.value != null
                  ? const CachePostListWidget()
                  : Center(
                      child: ErrorHandlingWidget(exception: e),
                    ),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
