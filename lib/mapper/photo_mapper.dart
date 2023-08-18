import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

import '../data_model/response/photo_response.dart';

final photoMapper = Provider<PhotoMapper>((ref) => PhotoMapper());

class PhotoMapper implements BaseResponseMapper<List, List<String>> {
  @override
  List<String> mapFromResponse(List data) {
    return data.take(3).map((e) => PhotoResponse.fromJson(e).url).toList();
  }
}
