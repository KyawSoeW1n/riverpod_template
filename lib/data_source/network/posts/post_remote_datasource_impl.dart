import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';
import '../../../data_model/vo/post_vo.dart';

class PostRemoteDataSourceImpl extends BaseRemoteSource
    implements PostsRemoteDataSource {
  final PostMapper _postMapper;

  PostRemoteDataSourceImpl(
    this._postMapper,
  );

  @override
  Future<List<PostVO>> getPostList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getToDoList}";
      return callApiWithErrorParser(() => dioClient.get(endpoint))
          .then((response) {
        return _postMapper.mapFromResponse(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
