import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';
import 'package:riverpod_testing/mapper/photo_mapper.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';
import '../../../data_model/response/post_response.dart';
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
  Future<AsyncValue<List<String>>> getPhotoList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getPhoto}";
      final dioCall = dioClient.get(endpoint);
      return callApiWithErrorParser(dioCall).then((response) {
        return AsyncData(_photoMapper.mapFromResponse(response.data));
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AsyncValue<List<PostVO>>> getPostList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getToDoList}";
      final dioCall = dioClient.get(endpoint);
      return callApiWithErrorParser(dioCall).then((response) {
        return AsyncData(_postMapper.mapFromResponse(response.data));
      });
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
  }
}
