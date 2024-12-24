import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'fetch_posts_usecase.dart';

final fetchPostUseCaseImpl = Provider.autoDispose<FetchPostsUseCaseImpl>(
  (ref) => FetchPostsUseCaseImpl(
    ref.watch(postRemoteDataSourceImpl),
  ),
);

class FetchPostsUseCaseImpl extends FetchPostsUseCase {
  final PostsRemoteDataSourceImpl _postRemoteDataSourceImpl;

  FetchPostsUseCaseImpl(
    this._postRemoteDataSourceImpl,
  );

  @override
  Future<void> fetchPostList() async {
    try {
      await _postRemoteDataSourceImpl.getPostList();
    } catch (e) {
      rethrow;
    }
  }
}
