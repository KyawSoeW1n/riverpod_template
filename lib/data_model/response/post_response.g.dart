// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostItemResponseImpl _$$PostItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostItemResponseImpl(
      title: json['title'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$PostItemResponseImplToJson(
        _$PostItemResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'userId': instance.userId,
      'id': instance.id,
    };
