import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';

part 'parsed_album_entity.g.dart';

@HiveType(typeId: 1)
class ParsedAlbumEntity extends Equatable{
  const ParsedAlbumEntity({required this.albumCoverUrl, required this.songs, required this.albumName, required this.artistName, required this.artistAvatar});

  @HiveField(0)
  final String albumCoverUrl;
  @HiveField(1)
  final String albumName;
  @HiveField(2)
  final List<ParsedSongEntity> songs;
  @HiveField(3)
  final String artistName;
  @HiveField(4)
  final String artistAvatar;
  
  @override
  List<Object?> get props => [albumCoverUrl, songs, albumName, artistName, artistAvatar];
}
