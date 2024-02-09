import 'package:equatable/equatable.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';

class ParsedAlbumEntity extends Equatable{
  const ParsedAlbumEntity({required this.albumCoverUrl, required this.songs, required this.albumName, required this.artistName, required this.artistAvatar});

  final String albumCoverUrl;
  final String albumName;
  final List<ParsedSongEntity> songs;
  final String artistName;
  final String artistAvatar;
  
  @override
  List<Object?> get props => [albumCoverUrl, songs];
}
