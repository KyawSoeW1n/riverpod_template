import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_vo.freezed.dart';

@freezed
class PostVO with _$PostVO {
  const factory PostVO({
    required bool isFavourite,
    required String title,
    required int id,
  }) = _PostVO;
}
