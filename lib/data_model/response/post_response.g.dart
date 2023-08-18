// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostItemResponse _$$_PostItemResponseFromJson(Map<String, dynamic> json) =>
    _$_PostItemResponse(
      title: json['title'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_PostItemResponseToJson(_$_PostItemResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'userId': instance.userId,
      'id': instance.id,
    };
