import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/features/favourites/domain/entities/sorted_artist_entity.dart';

abstract class DBRepository{
  bool isSongAlreadySaved({required String songName, required String albumName, required String artistName});
  List<SortedArtistEntity>? getSortedArtists();
  Future<void> saveSong({required ParsedSongEntity parsedSongEntity, required ParsedAlbumEntity parsedAlbumEntity});
  Future<void> deleteSong({required String songName, required String albumName, required String artistName});
}
