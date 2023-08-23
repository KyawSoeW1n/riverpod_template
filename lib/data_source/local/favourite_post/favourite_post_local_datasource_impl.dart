import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../core/network/base_remote_datasource.dart';
import '../app_database.dart';
import 'favourite_post_local_datasource.dart';

final postLocalDataSourceImpl = Provider<PostLocalDataSourceImpl>((ref) =>
    PostLocalDataSourceImpl(ref.read(postMapper), ref.read(databaseService)));

class PostLocalDataSourceImpl extends BaseRemoteSource
    implements FavouritePostLocalDataSource {
  final PostMapper postMapper;
  final DatabaseService _databaseService;

  PostLocalDataSourceImpl(
    this.postMapper,
    this._databaseService,
  );

  @override
  Future<void> addFavouritePost(CachePost cachePost) async {
    _databaseService.changePostStatus(cachePost);
  }

  @override
  Stream<List<CachePost>> getPostList() {
    return _databaseService.getPostStream();
  }

  @override
  Future<void> insertPostList(List<CachePost> postList) {
    return _databaseService.insertPostList(postList);
  }
}
