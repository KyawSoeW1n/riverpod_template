import 'package:riverpod_testing/data_model/cache/cache_post.dart';

abstract class FavouritePostLocalDataSource {
  Stream<List<CachePost>> getPostList();

  Future<void> addFavouritePost(CachePost cachePost);

  Future<void> insertPostList(List<CachePost> postList);
}
