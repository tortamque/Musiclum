import 'package:hive_flutter/hive_flutter.dart';
import 'package:musiclum/core/constants/hive_constants.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';

abstract class DatabaseService{
  List<ParsedAlbumEntity>? getAllAlbums();
}

class DatabaseServiceImpl implements DatabaseService{
  DatabaseServiceImpl(this._box);

  final Box<dynamic> _box;
  
  @override
  List<ParsedAlbumEntity>? getAllAlbums() => _box.get(songsKey, defaultValue: [])?.cast<ParsedAlbumEntity>();
}
