import 'package:riverpod_testing/data_model/cache/favourite_post.dart';

abstract class FavouritePostLocalDataSource {
  Stream<List<FavouritePost>> getPostList();

  Future<void> addFavouritePost(int id, String title);
}
