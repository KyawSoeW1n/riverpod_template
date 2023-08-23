import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'get_favourite_post_usecase.dart';

final getFavouritePostUseCaseImpl = Provider.autoDispose<GetFavouritePostUseCaseImpl>(
    (ref) => GetFavouritePostUseCaseImpl(ref.read(postLocalDataSourceImpl)));

class GetFavouritePostUseCaseImpl extends GetFavouritePostUseCase {
  final PostLocalDataSourceImpl _favouritePostLocalDataSourceImpl;

  GetFavouritePostUseCaseImpl(this._favouritePostLocalDataSourceImpl);

  @override
  Stream<List<CachePost>> getFavouritePostsList() {
    return _favouritePostLocalDataSourceImpl.getPostList();
  }
}
