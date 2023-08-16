import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/features/post/provider/post_provider.dart';
import 'package:riverpod_testing/features/post/provider/post_refresh_controller_provider.dart';
import 'package:riverpod_testing/features/post/provider/post_scroll_controller_provider.dart';
import 'package:riverpod_testing/features/post/widgets/error_handling_widget.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

import '../../app_constants/app_routes.dart';
import '../../core/base/base_view.dart';
import '../../widget/posts/post_item.dart';

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
    final refreshController = ref.watch(postRefreshControllerProvider);
    final scrollController = ref.watch(postScrollControllerProvider);
    final postProvider = ref.watch(postNotifierProvider);

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
          child: Consumer(
            builder: (context, ref, _) {
              return SmartRefresher(
                controller: refreshController,
                onRefresh: () =>
                    ref.read(postNotifierProvider.notifier).getPostList(),
                child: postProvider.maybeWhen(
                  success: (content) => CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return PostItem(
                              content[index],
                              ref
                                  .read(postNotifierProvider.notifier)
                                  .addFavouritePost,
                              isFav: getFavouritePostsProvider.value
                                  !.where((element) =>
                                      element.id == content[index].id)
                                  .isNotEmpty,
                            );
                          },
                          childCount:
                              content.length, // Number of items in the list
                        ),
                      ),
                    ],
                  ),
                  error: (e) => ErrorHandlingWidget(exception: e),
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
