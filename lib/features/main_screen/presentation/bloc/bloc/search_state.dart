part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState({this.artists, this.error});

  final List<ArtistEntity>? artists;
  final DioError? error;
  
  @override
  List<Object> get props => [artists!, error!];
}

final class SearchArtistsLoading extends SearchState {
  const SearchArtistsLoading();
}

final class SearchArtistsDone extends SearchState {
  const SearchArtistsDone(List<ArtistEntity> artists) : super(artists: artists);
}

final class SearchArtistsError extends SearchState {
  const SearchArtistsError(DioError error) : super(error: error);
}
