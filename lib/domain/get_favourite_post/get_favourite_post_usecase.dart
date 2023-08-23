import 'package:riverpod_testing/data_model/cache/cache_post.dart';

abstract class GetFavouritePostUseCase {
  Stream<List<CachePost>> getFavouritePostsList();
}
