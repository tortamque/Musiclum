import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'parsed_song_entity.g.dart';

@HiveType(typeId: 2)
class ParsedSongEntity extends Equatable{
  const ParsedSongEntity({required this.title, required this.durationMs, required this.index});

  @HiveField(0)
  final String title;
  @HiveField(1)
  final int durationMs;
  @HiveField(2)
  final int index;
  
  @override
  List<Object?> get props => [title, durationMs];
}
