// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';
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
    final dataStateAlbums = await _getAlbumsUseCase(event.artistId);
    late final List<UserAlbumEntity> albums;

    if(dataStateAlbums is DataFailed){
      return;
    } else{
      albums = dataStateAlbums.data!;
    }

    for (final album in albums) {
      final dataStateAlbumDetails = await _getAlbumDetailsUseCase(album.id!);
      late final List<AlbumTrackEntity> songs;

      if (dataStateAlbumDetails is DataFailed) {
        return;
      } else {
        songs = dataStateAlbumDetails.data!.items ?? [];
      }

      for (final song in songs) {
        print('${song.name} - ${song.durationMs} -');
      }
    }
  }
}
