import 'package:musiclum/core/shared/data/data_sources/local/database_service.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/features/favourites/domain/entities/sorted_artist_entity.dart';

class DBRepositoryImpl implements DBRepository{
  DBRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  bool isSongAlreadySaved({required String songName, required String albumName, required String artistName}) => _databaseService.isSongAlreadySaved(songName: songName, albumName: albumName, artistName: artistName);

  @override
  List<SortedArtistEntity>? getSortedArtists() {
    final albums = _databaseService.getAllAlbums();

    var artistMap = <String, SortedArtistEntity>{};

    if (albums == null) {
      return null;
    }

    for (var album in albums) {
      if (!artistMap.containsKey(album.artistName)) {
        artistMap[album.artistName] = SortedArtistEntity(
          name: album.artistName,
          imageUrl: album.artistAvatar, 
          songs: album.songs.map((song) => SortedSongEntity(
            albumName: album.albumName,
            albumCoverUrl: album.albumCoverUrl,
            title: song.title,
            durationMs: song.durationMs,
          ),).toList(),
        );
      } else {
        var newSongs = album.songs.map((song) => SortedSongEntity(
          albumName: album.albumName,
          albumCoverUrl: album.albumCoverUrl,
          title: song.title,
          durationMs: song.durationMs,
        )).toList();

        artistMap[album.artistName]!.songs.addAll(newSongs);
      }
    }

    var sortedArtists = artistMap.values.toList();
    sortedArtists.sort((a, b) => a.name.compareTo(b.name));
    for (var artist in sortedArtists) {
      artist.songs.sort((a, b) => a.title.compareTo(b.title));
    }
    
    return sortedArtists;
  }

  @override
  Future<void> saveSong({required ParsedSongEntity parsedSongEntity, required ParsedAlbumEntity parsedAlbumEntity}) => _databaseService.saveSong(parsedSongEntity: parsedSongEntity, parsedAlbumEntity: parsedAlbumEntity);
  
  @override
  Future<void> deleteSong({required String songName, required String albumName, required String artistName}) => _databaseService.deleteSong(songName: songName, albumName: albumName, artistName: artistName);
}
