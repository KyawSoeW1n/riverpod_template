import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../core/network/base_remote_datasource.dart';
import '../../../features/post/provider/post_provider.dart';
import '../app_database.dart';
import 'favourite_post_local_datasource.dart';

final postLocalDataSourceImpl = Provider<FavouritePostLocalDataSourceImpl>(
    (ref) => FavouritePostLocalDataSourceImpl(
        ref.read(postMapper), ref.read(databaseService)));

class FavouritePostLocalDataSourceImpl extends BaseRemoteSource
    implements FavouritePostLocalDataSource {
  final PostMapper postMapper;
  final DatabaseService _databaseService;

  FavouritePostLocalDataSourceImpl(
    this.postMapper,
    this._databaseService,
  );

  @override
  Future<void> addFavouritePost(int id, String title) async {
    _databaseService.addFavouritePost(id, title);
  }

  @override
  Stream<List<FavouritePost>> getPostList() {
    return _databaseService.getFavouriteStream();
  }
}
