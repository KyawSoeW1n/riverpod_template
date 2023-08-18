import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_response.freezed.dart';
part 'photo_response.g.dart';

@freezed
class PhotoResponse with _$PhotoResponse {
  const factory PhotoResponse({
    required String title,
    required String thumbnailUrl,
    required String url,
    required int albumId,
    required int id,
  }) = _PhotoResponse;

  factory PhotoResponse.fromJson(Map<String, Object?> json) =>
      _$PhotoResponseFromJson(json);
}
