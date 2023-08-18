// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostVO {
  bool get isFavourite => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostVOCopyWith<PostVO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostVOCopyWith<$Res> {
  factory $PostVOCopyWith(PostVO value, $Res Function(PostVO) then) =
      _$PostVOCopyWithImpl<$Res, PostVO>;
  @useResult
  $Res call({bool isFavourite, String title, int id});
}

/// @nodoc
class _$PostVOCopyWithImpl<$Res, $Val extends PostVO>
    implements $PostVOCopyWith<$Res> {
  _$PostVOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostVOCopyWith<$Res> implements $PostVOCopyWith<$Res> {
  factory _$$_PostVOCopyWith(_$_PostVO value, $Res Function(_$_PostVO) then) =
      __$$_PostVOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFavourite, String title, int id});
}

/// @nodoc
class __$$_PostVOCopyWithImpl<$Res>
    extends _$PostVOCopyWithImpl<$Res, _$_PostVO>
    implements _$$_PostVOCopyWith<$Res> {
  __$$_PostVOCopyWithImpl(_$_PostVO _value, $Res Function(_$_PostVO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_$_PostVO(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PostVO implements _PostVO {
  const _$_PostVO(
      {required this.isFavourite, required this.title, required this.id});

  @override
  final bool isFavourite;
  @override
  final String title;
  @override
  final int id;

  @override
  String toString() {
    return 'PostVO(isFavourite: $isFavourite, title: $title, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostVO &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavourite, title, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostVOCopyWith<_$_PostVO> get copyWith =>
      __$$_PostVOCopyWithImpl<_$_PostVO>(this, _$identity);
}

abstract class _PostVO implements PostVO {
  const factory _PostVO(
      {required final bool isFavourite,
      required final String title,
      required final int id}) = _$_PostVO;

  @override
  bool get isFavourite;
  @override
  String get title;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_PostVOCopyWith<_$_PostVO> get copyWith =>
      throw _privateConstructorUsedError;
}
