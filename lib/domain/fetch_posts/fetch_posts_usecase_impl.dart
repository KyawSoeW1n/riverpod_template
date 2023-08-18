import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'fetch_posts_usecase.dart';

final fetchPostUseCaseImpl = Provider.autoDispose<FetchPostsUseCaseImpl>(
  (ref) => FetchPostsUseCaseImpl(
    ref.watch(postRemoteDataSourceImpl),
    ref.watch(postLocalDataSourceImpl),
  ),
);

class FetchPostsUseCaseImpl extends FetchPostsUseCase {
  final PostRemoteDataSourceImpl _postRemoteDataSourceImpl;
  final PostLocalDataSourceImpl _postLocalDataSourceImpl;

  FetchPostsUseCaseImpl(
    this._postRemoteDataSourceImpl,
    this._postLocalDataSourceImpl,
  );

  @override
  Future<void> fetchPostList() async {
    try {
      final postList = await _postRemoteDataSourceImpl.getPostList();
      _postLocalDataSourceImpl.insertPostList(postList);
    } catch (e) {
      rethrow;
    }
  }
}
