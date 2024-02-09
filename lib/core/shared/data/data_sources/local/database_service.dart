import 'package:hive_flutter/hive_flutter.dart';
import 'package:musiclum/core/constants/hive_constants.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';

abstract class DatabaseService{
  List<ParsedAlbumEntity>? getAllAlbums();
  Future<void> saveSong({required ParsedSongEntity parsedSongEntity, required ParsedAlbumEntity parsedAlbumEntity});
}

class DatabaseServiceImpl implements DatabaseService{
  DatabaseServiceImpl(this._box);

  final Box<dynamic> _box;
  
  @override
  List<ParsedAlbumEntity>? getAllAlbums() => _box.get(songsKey, defaultValue: [])?.cast<ParsedAlbumEntity>();
  
  @override
  Future<void> saveSong({required ParsedSongEntity parsedSongEntity, required ParsedAlbumEntity parsedAlbumEntity}) async {
    var albums = getAllAlbums() ?? [];

    final isAlbumAlreadySaved = _isAlbumAlreadySaved(albums, parsedAlbumEntity.albumName, parsedAlbumEntity.artistName);
    if(isAlbumAlreadySaved){
      print('isAlbumAlreadySaved, adding: ${parsedSongEntity.title}');
      for(var album in albums){
        if(album.albumName == parsedAlbumEntity.albumName && album.artistName == parsedAlbumEntity.artistName){
          album.songs.add(parsedSongEntity);
          await _box.put(songsKey, [...albums]);
          return;
        }
      }
    } else{
      parsedAlbumEntity.songs.clear();
      parsedAlbumEntity.songs.add(parsedSongEntity);
      await _box.put(songsKey, [...albums, parsedAlbumEntity]);
    }
  }

  bool _isAlbumAlreadySaved(List<ParsedAlbumEntity> albums, String albumName, String artistName){
    for(var album in albums){
      if(album.albumName == albumName && album.artistName == artistName){
        return true;
      }
    }
    return false;
  }
}
