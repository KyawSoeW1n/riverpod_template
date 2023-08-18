import 'package:riverpod_testing/data_model/cache/favourite_post.dart';

abstract class ChangePostStatusUseCase {
  Future<void> changePostStatus(CachePost cachePost);
}
