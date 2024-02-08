import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/data/models/artist_model.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  @override
  Future<DataState<List<ArtistModel>>> getArtists(String query) {
    
  }
}
