import 'package:musiclum/core/shared/data/data_sources/local/database_service.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';

class DBRepositoryImpl implements DBRepository{
  DBRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  bool isSongAlreadySaved({required String songName, required String albumName, required String artistName}) => _databaseService.isSongAlreadySaved(songName: songName, albumName: albumName, artistName: artistName);
}
