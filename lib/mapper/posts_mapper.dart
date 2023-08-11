import 'package:riverpod_testing/data_model/response/post_response.dart';
import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

import '../data_model/vo/post_vo.dart';

class PostMapper implements BaseResponseMapper<List, List<PostVO>> {
  @override
  List<PostVO> mapFromResponse(List data) {
    return data
        .map((e) => PostVO(
              id: PostItemResponse.fromJson(e).id,
              title: PostItemResponse.fromJson(e).title,
              isFavourite: false,
            ))
        .toList();
  }
}
