import '../data_model/response/photo_response.dart';

class PhotoMapper {
  List<String> getUrlList(List<PhotoResponse> data) {
    return data.map((e) => PhotoResponse.fromJson(e).url).toList();
  }
}
