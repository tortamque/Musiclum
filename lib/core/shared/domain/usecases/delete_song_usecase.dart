import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class DeleteSongUseCase implements UseCase<void, DeleteSongUseCaseParams>{
  DeleteSongUseCase(this._dbRepository);

  final DBRepository _dbRepository;

  @override
  Future<void> call(DeleteSongUseCaseParams params) => _dbRepository.deleteSong(
    songName: params.songName,
    albumName: params.albumName,
    artistName: params.artistName,
  );
}

class DeleteSongUseCaseParams{
  DeleteSongUseCaseParams({required this.songName, required this.albumName, required this.artistName});

  final String songName;
  final String albumName;
  final String artistName;
}
