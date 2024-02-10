import 'package:dio/dio.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';

sealed class ArtistInfoState {
  const ArtistInfoState({this.albums, this.error});

  final List<ParsedAlbumEntity>? albums;
  final DioError? error;
}

final class GetArtistInfoLoading extends ArtistInfoState {
  const GetArtistInfoLoading();
}

final class GetArtistInfoDone extends ArtistInfoState {
  const GetArtistInfoDone(List<ParsedAlbumEntity> albums) : super(albums: albums);
}

final class GetArtistInfoError extends ArtistInfoState {
  const GetArtistInfoError(DioError error) : super(error: error);
}
