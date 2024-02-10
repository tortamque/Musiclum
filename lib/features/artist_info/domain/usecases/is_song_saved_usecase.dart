import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class IsSongSavedUseCase implements SyncUseCase<bool, IsSongSavedParams>{
  IsSongSavedUseCase(this._dbRepository);

  final DBRepository _dbRepository;

  @override
  bool call(IsSongSavedParams params) => _dbRepository.isSongAlreadySaved(
    songName: params.songName, 
    albumName: params.albumName, 
    artistName: params.artistName,
  );
}

class IsSongSavedParams{
  IsSongSavedParams({required this.songName, required this.albumName, required this.artistName});

  final String songName;
  final String albumName;
  final String artistName;
}
