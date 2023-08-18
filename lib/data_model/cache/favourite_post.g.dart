// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachePostAdapter extends TypeAdapter<CachePost> {
  @override
  final int typeId = 1;

  @override
  CachePost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachePost(
      fields[0] as int,
      fields[1] as String,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CachePost obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachePostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
