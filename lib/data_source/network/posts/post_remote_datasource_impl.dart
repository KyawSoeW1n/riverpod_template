import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_model/response/photo_response.dart';
import 'package:riverpod_testing/data_source/network/posts/post_remote_datasource.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';
import '../../../data_model/response/post_response.dart';

class PostRemoteDataSourceImpl extends BaseRemoteSource
    implements PostsRemoteDataSource {
  @override
  Future<AsyncValue<List<String>>> getPhotoList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getPhoto}";
      final dioCall = dioClient.get(endpoint);
      return callApiWithErrorParser(dioCall).then((response) {
        var posts = response.data as List;
        final formattedList =
            posts.map((e) => PhotoResponse.fromJson(e).url!).toList();
        return AsyncData(formattedList);
      });
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<List<String>>> getPostList() async {
    try {
      const endpoint = "${AppConstants.baseUrl}${ApiRoutes.getToDoList}";
      final dioCall = dioClient.get(endpoint);
      return callApiWithErrorParser(dioCall).then((response) {
        var posts = response.data as List;
        final formattedList =
        posts.map((e) => PostItemResponse.fromJson(e).title!).toList();
        return AsyncData(formattedList);
      });
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
    // try {
    //   final dio = Dio();
    //   Response response = await dio.get(ApiRoutes.getToDoList);
    //   var posts = response.data as List;
    //   final formattedList =
    //       posts.map((e) => PostItemResponse.fromJson(e).title!).toList();
    //   return AsyncData(formattedList);
    // } catch (e) {
    //   return AsyncError(e, StackTrace.current);
    // }
  }
}
