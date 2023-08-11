import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';
import 'package:riverpod_testing/mapper/photo_mapper.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';
import '../../../data_model/vo/post_vo.dart';

class PostRemoteDataSourceImpl extends BaseRemoteSource
    implements PostsRemoteDataSource {
  final PhotoMapper _photoMapper;
  final PostMapper _postMapper;

  PostRemoteDataSourceImpl(
    this._photoMapper,
    this._postMapper,
  );

  @override
  Future<List<String>> getPhotoList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getPhoto}";
      return callApiWithErrorParser(() => dioClient.get(endpoint))
          .then((response) {
        return _photoMapper.mapFromResponse(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

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

  @override
  Future<AsyncValue<List<String>>> getPhotoTestingList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getPhotoTest}";
      return callApiWithErrorParser(() => dioClient.get(endpoint))
          .then((response) {
        return AsyncData(_photoMapper.mapFromResponse(response.data));
      });
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
  }
}
