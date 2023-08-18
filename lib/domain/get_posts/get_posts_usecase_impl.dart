import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'get_posts_usecase.dart';

final getPostUseCaseImpl = Provider<GetPostsUseCaseImpl>(
  (ref) => GetPostsUseCaseImpl(
    ref.watch(postRemoteDataSourceImpl),
    ref.watch(postLocalDataSourceImpl),
  ),
);

class GetPostsUseCaseImpl extends GetPostsUseCase {
  final PostRemoteDataSourceImpl _postRemoteDataSourceImpl;
  final PostLocalDataSourceImpl _postLocalDataSourceImpl;

  GetPostsUseCaseImpl(
    this._postRemoteDataSourceImpl,
    this._postLocalDataSourceImpl,
  );

  @override
  Future<void> getPostList() async {
    try {
      final postList = await _postRemoteDataSourceImpl.getPostList();
      _postLocalDataSourceImpl.insertPostList(postList);
    } catch (e) {
      rethrow;
    }
  }
}
