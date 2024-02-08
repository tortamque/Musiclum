// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_albums_usecase.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_event.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_state.dart';

class ArtistInfoBloc extends Bloc<ArtistInfoEvent, ArtistInfoState> {
  ArtistInfoBloc(this._getAlbumsUseCase) : super(const GetArtistInfoLoading()) {
    on<GetArtistInfoEvent>(_onSearchArtists);
  }

  final GetAlbumsUseCase _getAlbumsUseCase;

  Future<void> _onSearchArtists(GetArtistInfoEvent event, Emitter<ArtistInfoState> emitter) async{
    print('inside');
    final dataState = await _getAlbumsUseCase(event.artistId);

    if(dataState is DataSuccess){
      print(dataState.data![0].name);
      emit(
        GetArtistInfoDone(dataState.data!),
      );
    }

    if(dataState is DataFailed){
      emit(
        GetArtistInfoError(
          dataState.error!,
        ),
      );
    }
  }
}