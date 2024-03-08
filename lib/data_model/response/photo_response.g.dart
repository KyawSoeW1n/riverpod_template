// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoResponseImpl _$$PhotoResponseImplFromJson(Map<String, dynamic> json) =>
    _$PhotoResponseImpl(
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
      albumId: json['albumId'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$PhotoResponseImplToJson(_$PhotoResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'url': instance.url,
      'albumId': instance.albumId,
      'id': instance.id,
    };
