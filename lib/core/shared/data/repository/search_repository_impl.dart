import 'dart:io';

import 'package:dio/dio.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/sensitive.dart';
import 'package:musiclum/core/shared/data/data_sources/remote/api_service.dart';
import 'package:musiclum/core/shared/data/models/album_cover_model.dart';
import 'package:musiclum/core/shared/data/models/artist_model.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  SearchRepositoryImpl(this._apiService);

  final ApiService _apiService;  

  @override
  Future<DataState<List<ArtistModel>>> searchArtists(String query) async {
    try{
      final response = await _apiService.searchArtists(
        query: query,
        type: 'artist',
        authToken: 'Authorization: Bearer $token',
      );

      if(response.response.statusCode == HttpStatus.ok){
        return DataSuccess(response.data);
      } else{
        return DataFailed(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<UserAlbumEntity>>> getArtistAlbums(String artistId) async {
    try{
      final response = await _apiService.getArtistAlbums(
        artistId: artistId,
        authToken: 'Authorization: Bearer $token',
      );

      if(response.response.statusCode == HttpStatus.ok){
        return DataSuccess(response.data);
      } else{
        return DataFailed(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AlbumEntity>> getAlbumDetails(String albumId) async {
    try{
      final response = await _apiService.getAlbumDetails(
        albumId: albumId,
        authToken: 'Authorization: Bearer $token',
      );

      if(response.response.statusCode == HttpStatus.ok){
        return DataSuccess(response.data);
      } else{
        return DataFailed(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<AlbumCoverModel>>> getAlbumCover(String albumId) async {
    try{
      final response = await _apiService.getAlbumCover(
        albumId: albumId,
        authToken: 'Authorization: Bearer $token',
      );

      if(response.response.statusCode == HttpStatus.ok){
        return DataSuccess(response.data);
      } else{
        return DataFailed(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}
