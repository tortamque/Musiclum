// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/constants/ui_constants.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_cover_entity.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';
import 'package:musiclum/features/artist_info/domain/entities/parsed_album_entity.dart';
import 'package:musiclum/features/artist_info/domain/entities/parsed_song_entity.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_cover_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_details_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_albums_usecase.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_event.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_state.dart';

class ArtistInfoBloc extends Bloc<ArtistInfoEvent, ArtistInfoState> {
  ArtistInfoBloc(this._getAlbumsUseCase, this._getAlbumDetailsUseCase, this._getAlbumCoverUseCase) : super(const GetArtistInfoLoading()) {
    on<GetArtistInfoEvent>(_onSearchArtists);
  }

  final GetAlbumsUseCase _getAlbumsUseCase;
  final GetAlbumDetailsUseCase _getAlbumDetailsUseCase;
  final GetAlbumCoverUseCase _getAlbumCoverUseCase;

  Future<void> _onSearchArtists(GetArtistInfoEvent event, Emitter<ArtistInfoState> emitter) async{
    final albums = <ParsedAlbumEntity>[];

    final dataStateAlbums = await _getAlbumsUseCase(event.artistId);
    late final List<UserAlbumEntity> albumEntities;

    if(dataStateAlbums is DataFailed){
      emit(
        GetArtistInfoError(
          dataStateAlbums.error!,
        ),
      );
      return;
    } else{
      albumEntities = dataStateAlbums.data!;
    }

    for (final albumEntity in albumEntities) {
      final dataStateAlbumDetails = await _getAlbumDetailsUseCase(albumEntity.id!);
      late final List<AlbumTrackEntity> songs;
      if (dataStateAlbumDetails is DataFailed) {
        emit(
          GetArtistInfoError(
            dataStateAlbumDetails.error!,
          ),
        );
        return;
      } else {
        songs = dataStateAlbumDetails.data!.items ?? [];
      }
      
      final dataStateAlbumCover = await _getAlbumCoverUseCase(albumEntity.id!);
      late final List<AlbumCoverEntity> albumCovers;
      if(dataStateAlbumCover is DataFailed){
        albumCovers = [const AlbumCoverEntity(url: defaultAlbumCoverUrl, height: 1000, width: 1000)];
      } else{
        albumCovers = dataStateAlbumCover.data ?? [const AlbumCoverEntity(url: defaultAlbumCoverUrl, height: 1000, width: 1000)];
      }

      
      final album = ParsedAlbumEntity(
        albumCoverUrl: albumCovers[0].url,
        songs: [],
      );
      

      for (final song in songs) {
        album.songs.add(ParsedSongEntity(
          title: song.name ?? "Can't find song name",
          durationMs: song.durationMs ?? 0,
        ));
        print('${song.name} - ${song.durationMs} - ${albumCovers[0].url}');
      }

      albums.add(album);
    }

    emit(
      GetArtistInfoDone(albums),
    );
  }
}
