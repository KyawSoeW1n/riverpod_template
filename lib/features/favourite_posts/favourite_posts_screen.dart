import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/features/favourite_posts/provider/favourite_post_provider.dart';
import 'package:riverpod_testing/widget/common/common_app_bar.dart';

class FavouritePostsScreen extends ConsumerWidget {
  const FavouritePostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final getFavouritePostsStream = ref.watch(favouritePostNotifierProvider);
    return Scaffold(
      appBar: CommonAppBar("Favourites"),
    );
  }
}
