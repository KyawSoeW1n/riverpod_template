// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostItemResponse _$PostItemResponseFromJson(Map<String, dynamic> json) {
  return _PostItemResponse.fromJson(json);
}

/// @nodoc
mixin _$PostItemResponse {
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostItemResponseCopyWith<PostItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostItemResponseCopyWith<$Res> {
  factory $PostItemResponseCopyWith(
          PostItemResponse value, $Res Function(PostItemResponse) then) =
      _$PostItemResponseCopyWithImpl<$Res, PostItemResponse>;
  @useResult
  $Res call({String title, bool completed, int userId, int id});
}

/// @nodoc
class _$PostItemResponseCopyWithImpl<$Res, $Val extends PostItemResponse>
    implements $PostItemResponseCopyWith<$Res> {
  _$PostItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? completed = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostItemResponseCopyWith<$Res>
    implements $PostItemResponseCopyWith<$Res> {
  factory _$$_PostItemResponseCopyWith(
          _$_PostItemResponse value, $Res Function(_$_PostItemResponse) then) =
      __$$_PostItemResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, bool completed, int userId, int id});
}

/// @nodoc
class __$$_PostItemResponseCopyWithImpl<$Res>
    extends _$PostItemResponseCopyWithImpl<$Res, _$_PostItemResponse>
    implements _$$_PostItemResponseCopyWith<$Res> {
  __$$_PostItemResponseCopyWithImpl(
      _$_PostItemResponse _value, $Res Function(_$_PostItemResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? completed = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_$_PostItemResponse(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
class _$_PostItemResponse implements _PostItemResponse {
  const _$_PostItemResponse(
      {required this.title,
      required this.completed,
      required this.userId,
      required this.id});

  factory _$_PostItemResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostItemResponseFromJson(json);

  @override
  final String title;
  @override
  final bool completed;
  @override
  final int userId;
  @override
  final int id;

  @override
  String toString() {
    return 'PostItemResponse(title: $title, completed: $completed, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostItemResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, completed, userId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostItemResponseCopyWith<_$_PostItemResponse> get copyWith =>
      __$$_PostItemResponseCopyWithImpl<_$_PostItemResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostItemResponseToJson(
      this,
    );
  }
}

abstract class _PostItemResponse implements PostItemResponse {
  const factory _PostItemResponse(
      {required final String title,
      required final bool completed,
      required final int userId,
      required final int id}) = _$_PostItemResponse;

  factory _PostItemResponse.fromJson(Map<String, dynamic> json) =
      _$_PostItemResponse.fromJson;

  @override
  String get title;
  @override
  bool get completed;
  @override
  int get userId;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_PostItemResponseCopyWith<_$_PostItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
