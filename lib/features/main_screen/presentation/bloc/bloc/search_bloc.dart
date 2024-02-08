// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/features/main_screen/domain/usecases/search_artists_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchArtistsUseCase) : super(const SearchArtistsLoading()) {
    on<SearchArtistsEvent>(_onSearchArtists);
  }

  final SearchArtistsUseCase _searchArtistsUseCase;

  Future<void> _onSearchArtists(SearchArtistsEvent event, Emitter<SearchState> emitter) async{
    final dataState = await _searchArtistsUseCase(event.query);

    if(dataState is DataSuccess){
      emit(
        SearchArtistsDone(dataState.data!),
      );
    }

    if(dataState is DataFailed){
      emit(
        SearchArtistsError(
          dataState.error!
        ),
      );
    }
  }
}
