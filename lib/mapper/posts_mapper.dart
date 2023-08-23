import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/data_model/response/post_response.dart';
import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

final postMapper = Provider<PostMapper>((ref) => PostMapper());

class PostMapper implements BaseResponseMapper<List, List<CachePost>> {
  @override
  List<CachePost> mapFromResponse(List data) {
    return data
        .map((e) => CachePost(
              PostItemResponse.fromJson(e).id,
              PostItemResponse.fromJson(e).title,
              false,
            ))
        .toList();
  }
}
