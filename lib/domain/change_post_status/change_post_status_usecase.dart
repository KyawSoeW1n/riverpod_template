import 'package:riverpod_testing/data_model/cache/cache_post.dart';

abstract class ChangePostStatusUseCase {
  Future<void> changePostStatus(CachePost cachePost);
}
