// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_album_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParsedAlbumEntityAdapter extends TypeAdapter<ParsedAlbumEntity> {
  @override
  final int typeId = 1;

  @override
  ParsedAlbumEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParsedAlbumEntity(
      albumCoverUrl: fields[0] as String,
      songs: (fields[2] as List).cast<ParsedSongEntity>(),
      albumName: fields[1] as String,
      artistName: fields[3] as String,
      artistAvatar: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParsedAlbumEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.albumCoverUrl)
      ..writeByte(1)
      ..write(obj.albumName)
      ..writeByte(2)
      ..write(obj.songs)
      ..writeByte(3)
      ..write(obj.artistName)
      ..writeByte(4)
      ..write(obj.artistAvatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParsedAlbumEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
