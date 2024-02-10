import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class SaveSongUseCase implements UseCase<void, SaveSongUseCaseParams>{
  SaveSongUseCase(this._dbRepository);

  final DBRepository _dbRepository;

  @override
  Future<void> call(SaveSongUseCaseParams params) => _dbRepository.saveSong(
    parsedSongEntity: params.parsedSongEntity,
    parsedAlbumEntity: params.parsedAlbumEntity,
  );
}

class SaveSongUseCaseParams{
  SaveSongUseCaseParams({required this.parsedSongEntity, required this.parsedAlbumEntity});

  final ParsedSongEntity parsedSongEntity;
  final ParsedAlbumEntity parsedAlbumEntity;
}
