import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/base/base_view.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

import 'notifier/favourite_post_provider.dart';

class FavouritePostsScreen extends BaseView {
  FavouritePostsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const CommonAppBar("Favourites");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
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
            return Expanded(
              child: ListView.builder(
                itemCount: config.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$index",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          config[index].title,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
