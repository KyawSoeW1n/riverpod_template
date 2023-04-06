import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/network/response/test_response.dart';

class PostService {
  Future<AsyncValue<List<String>>> getPostList() async {
    try {
      final dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');
      var posts = response.data as List;
      final formattedList =
          posts.map((e) => TestResponse.fromJson(e).title!).toList();
      return AsyncData(formattedList);
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
  }
}
