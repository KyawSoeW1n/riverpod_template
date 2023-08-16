import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/vo/post_vo.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'get_posts_usecase.dart';

final getPostUseCaseImpl = Provider<GetPostsUseCaseImpl>(
    (ref) => GetPostsUseCaseImpl(ref.watch(postRemoteDataSourceImpl)));

class GetPostsUseCaseImpl extends GetPostsUseCase {
  final PostRemoteDataSourceImpl _postRemoteDataSourceImpl;

  GetPostsUseCaseImpl(this._postRemoteDataSourceImpl);

  @override
  Future<List<PostVO>> getPostList() async {
    return await _postRemoteDataSourceImpl.getPostList();
  }
}
