import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';

final postRemoteDataSourceImpl =
    Provider.autoDispose<PostsRemoteDataSourceImpl>(
  (ref) => PostsRemoteDataSourceImpl(
    ref.watch(postMapper),
    ref.watch(postLocalDataSourceImpl),
  ),
);

class PostsRemoteDataSourceImpl extends BaseRemoteSource
    implements PostsRemoteDataSource {
  final PostMapper _postMapper;
  final FavouritePostLocalDataSource _favouritePostLocalDataSource;

  PostsRemoteDataSourceImpl(
    this._postMapper,
    this._favouritePostLocalDataSource,
  );

  @override
  Future<List<CachePost>> getPostList() async {
    try {
      final endpoint = "${AppConstants.baseUrl}${ApiRoutes.getToDoList}";
      return callApiWithErrorParser(() => dioClient.get(endpoint))
          .then((response) {
        final list = _postMapper.mapFromResponse(response.data);
        _favouritePostLocalDataSource.insertPostList(list);
        return list;
      });
    } catch (e) {
      rethrow;
    }
  }
}
