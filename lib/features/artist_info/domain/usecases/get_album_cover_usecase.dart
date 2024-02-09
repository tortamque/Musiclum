import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_cover_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class GetAlbumCoverUseCase implements UseCase<DataState<List<AlbumCoverEntity>>, String>{
  GetAlbumCoverUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<List<AlbumCoverEntity>>> call(String params) => _searchRepository.getAlbumCover(params);
}
