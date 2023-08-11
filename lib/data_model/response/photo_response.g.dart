// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoResponse _$$_PhotoResponseFromJson(Map<String, dynamic> json) =>
    _$_PhotoResponse(
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
      albumId: json['albumId'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_PhotoResponseToJson(_$_PhotoResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'url': instance.url,
      'albumId': instance.albumId,
      'id': instance.id,
    };
