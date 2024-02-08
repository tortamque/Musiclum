import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/core/usecases/usecase.dart';

class SearchArtistsUseCase implements UseCase<DataState<List<ArtistEntity>>, String>{
  SearchArtistsUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<List<ArtistEntity>>> call(String params) => _searchRepository.searchArtists(params);
}
