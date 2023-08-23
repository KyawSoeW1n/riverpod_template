import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'change_post_status_usecase.dart';

final changePostStatusUseCaseImpl = Provider.autoDispose<ChangePostStatusUseCaseImpl>(
    (ref) => ChangePostStatusUseCaseImpl(ref.read(postLocalDataSourceImpl)));

class ChangePostStatusUseCaseImpl extends ChangePostStatusUseCase {
  final PostLocalDataSourceImpl _favouritePostLocalDataSourceImpl;

  ChangePostStatusUseCaseImpl(this._favouritePostLocalDataSourceImpl);

  @override
  Future<void> changePostStatus(CachePost cachePost) async {
    return await _favouritePostLocalDataSourceImpl.addFavouritePost(cachePost);
  }
}
