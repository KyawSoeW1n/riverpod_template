// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouritePostAdapter extends TypeAdapter<FavouritePost> {
  @override
  final int typeId = 1;

  @override
  FavouritePost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouritePost(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouritePost obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouritePostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
