// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parsed_song_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParsedSongEntityAdapter extends TypeAdapter<ParsedSongEntity> {
  @override
  final int typeId = 2;

  @override
  ParsedSongEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParsedSongEntity(
      title: fields[0] as String,
      durationMs: fields[1] as int,
      index: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ParsedSongEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.durationMs)
      ..writeByte(2)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParsedSongEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
