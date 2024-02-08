part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchArtistsEvent extends SearchEvent{
  const SearchArtistsEvent({required this.query});

  final String query;
}
