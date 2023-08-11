import 'package:riverpod_testing/mapper/base/base_response_mapper.dart';

import '../data_model/response/photo_response.dart';

class PhotoMapper
    implements BaseResponseMapper<List, List<String>> {
  @override
  List<String> mapFromResponse(List data) {
    return data.map((e) => PhotoResponse.fromJson(e).url).toList();
  }
}
