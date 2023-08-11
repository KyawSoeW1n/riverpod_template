// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) {
  return _PhotoResponse.fromJson(json);
}

/// @nodoc
mixin _$PhotoResponse {
  String get title => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get albumId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoResponseCopyWith<PhotoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoResponseCopyWith<$Res> {
  factory $PhotoResponseCopyWith(
          PhotoResponse value, $Res Function(PhotoResponse) then) =
      _$PhotoResponseCopyWithImpl<$Res, PhotoResponse>;
  @useResult
  $Res call(
      {String title, String thumbnailUrl, String url, int albumId, int id});
}

/// @nodoc
class _$PhotoResponseCopyWithImpl<$Res, $Val extends PhotoResponse>
    implements $PhotoResponseCopyWith<$Res> {
  _$PhotoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? thumbnailUrl = null,
    Object? url = null,
    Object? albumId = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoResponseCopyWith<$Res>
    implements $PhotoResponseCopyWith<$Res> {
  factory _$$_PhotoResponseCopyWith(
          _$_PhotoResponse value, $Res Function(_$_PhotoResponse) then) =
      __$$_PhotoResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String thumbnailUrl, String url, int albumId, int id});
}

/// @nodoc
class __$$_PhotoResponseCopyWithImpl<$Res>
    extends _$PhotoResponseCopyWithImpl<$Res, _$_PhotoResponse>
    implements _$$_PhotoResponseCopyWith<$Res> {
  __$$_PhotoResponseCopyWithImpl(
      _$_PhotoResponse _value, $Res Function(_$_PhotoResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? thumbnailUrl = null,
    Object? url = null,
    Object? albumId = null,
    Object? id = null,
  }) {
    return _then(_$_PhotoResponse(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotoResponse implements _PhotoResponse {
  const _$_PhotoResponse(
      {required this.title,
      required this.thumbnailUrl,
      required this.url,
      required this.albumId,
      required this.id});

  factory _$_PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoResponseFromJson(json);

  @override
  final String title;
  @override
  final String thumbnailUrl;
  @override
  final String url;
  @override
  final int albumId;
  @override
  final int id;

  @override
  String toString() {
    return 'PhotoResponse(title: $title, thumbnailUrl: $thumbnailUrl, url: $url, albumId: $albumId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, thumbnailUrl, url, albumId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoResponseCopyWith<_$_PhotoResponse> get copyWith =>
      __$$_PhotoResponseCopyWithImpl<_$_PhotoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoResponseToJson(
      this,
    );
  }
}

abstract class _PhotoResponse implements PhotoResponse {
  const factory _PhotoResponse(
      {required final String title,
      required final String thumbnailUrl,
      required final String url,
      required final int albumId,
      required final int id}) = _$_PhotoResponse;

  factory _PhotoResponse.fromJson(Map<String, dynamic> json) =
      _$_PhotoResponse.fromJson;

  @override
  String get title;
  @override
  String get thumbnailUrl;
  @override
  String get url;
  @override
  int get albumId;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoResponseCopyWith<_$_PhotoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
