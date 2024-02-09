import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class GetAlbumDetailsUseCase implements UseCase<DataState<AlbumEntity>, String>{
  GetAlbumDetailsUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<AlbumEntity>> call(String params) => _searchRepository.getAlbumDetails(params);
}
