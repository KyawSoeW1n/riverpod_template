import '../../../data_model/cache/cache_post.dart';

abstract class PostsRemoteDataSource {
  Future<List<CachePost>> getPostList();
}
