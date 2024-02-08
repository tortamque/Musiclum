import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class GetAlbumsUseCase implements UseCase<DataState<List<UserAlbumEntity>>, String>{
  GetAlbumsUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<List<UserAlbumEntity>>> call(String params) => _searchRepository.getArtistAlbums(params);
}
