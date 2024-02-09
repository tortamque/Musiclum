import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/shared/domain/entities/album_cover_entity.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';

abstract class SearchRepository{
  Future<DataState<List<ArtistEntity>>> searchArtists(String query);
  Future<DataState<List<UserAlbumEntity>>> getArtistAlbums(String artistId);
  Future<DataState<AlbumEntity>> getAlbumDetails(String albumId);
  Future<DataState<List<AlbumCoverEntity>>> getAlbumCover(String albumId);
}
