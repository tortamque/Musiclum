import 'package:equatable/equatable.dart';
import 'package:musiclum/features/artist_info/domain/entities/parsed_song_entity.dart';

class ParsedAlbumEntity extends Equatable{
  const ParsedAlbumEntity({required this.albumCoverUrl, required this.songs});

  final String albumCoverUrl;
  final List<ParsedSongEntity> songs;
  
  @override
  List<Object?> get props => [albumCoverUrl, songs];
}
