import '../../../data_model/cache/favourite_post.dart';

abstract class PostsRemoteDataSource {
  Future<List<CachePost>> getPostList();
}
