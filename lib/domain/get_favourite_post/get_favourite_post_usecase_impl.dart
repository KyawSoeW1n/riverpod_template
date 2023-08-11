import 'package:riverpod_testing/data_model/cache/favourite_post.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'get_favourite_post_usecase.dart';

class GetFavouritePostUseCaseImpl extends GetFavouritePostUseCase {
  final FavouritePostLocalDataSourceImpl _favouritePostLocalDataSourceImpl;

  GetFavouritePostUseCaseImpl(this._favouritePostLocalDataSourceImpl);

  @override
  Stream<List<FavouritePost>> getFavouritePostsList() {
    return _favouritePostLocalDataSourceImpl.getPostList();
  }
}
