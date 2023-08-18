import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
class PostItemResponse with _$PostItemResponse {
  const factory PostItemResponse({
    required String title,
    required bool completed,
    required int userId,
    required int id,
  }) = _PostItemResponse;

  factory PostItemResponse.fromJson(Map<String, Object?> json) =>
      _$PostItemResponseFromJson(json);
}
