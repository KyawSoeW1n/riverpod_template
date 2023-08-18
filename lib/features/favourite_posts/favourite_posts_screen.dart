import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/base/base_view.dart';
import 'package:riverpod_testing/features/favourite_posts/widget/favourite_post_item_widget.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

import '../../data_source/local/app_database.dart';
import 'notifier/favourite_post_notifier.dart';

class FavouritePostsScreen extends BaseView {
  FavouritePostsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const CommonAppBar("Favourites");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final favouritePostNotiProvider =
        ref.watch(favouritePostNotifierProvider.notifier);
    final favouritePostsProvider = ref.watch(favouritePostListStream);
    return Column(
      children: [
        favouritePostsProvider.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (err, stack) => Container(),
          data: (content) {
            return Expanded(
                child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return FavouritePostItemWidget(
                        content[index],
                        favouritePostNotiProvider.changePostStatus,
                      );
                    },
                    childCount: content.length, // Number of items in the list
                  ),
                )
              ],
            ));
          },
        )
      ],
    );
  }
}
