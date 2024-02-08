// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_details_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_albums_usecase.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_event.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_state.dart';

class ArtistInfoBloc extends Bloc<ArtistInfoEvent, ArtistInfoState> {
  ArtistInfoBloc(this._getAlbumsUseCase, this._getAlbumDetailsUseCase) : super(const GetArtistInfoLoading()) {
    on<GetArtistInfoEvent>(_onSearchArtists);
  }

  final GetAlbumsUseCase _getAlbumsUseCase;
  final GetAlbumDetailsUseCase _getAlbumDetailsUseCase;

  Future<void> _onSearchArtists(GetArtistInfoEvent event, Emitter<ArtistInfoState> emitter) async{
    final dataState = await _getAlbumsUseCase(event.artistId);
    final a = await _getAlbumDetailsUseCase('0XfbMn9N6vzDybKtXBIKx0');
    print(a.data!.name);

    if(dataState is DataSuccess){
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