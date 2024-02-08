import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';

abstract class SearchRepository{
  Future<DataState<List<ArtistEntity>>> searchArtists(String query);
}
