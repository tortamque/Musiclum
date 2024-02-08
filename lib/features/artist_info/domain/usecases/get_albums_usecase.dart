import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class GetAlbumsUseCase implements UseCase<DataState<List<AlbumEntity>>, String>{
  GetAlbumsUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<List<AlbumEntity>>> call(String params) => _searchRepository.getArtistAlbums(params);
}
