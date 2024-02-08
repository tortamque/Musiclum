import 'dart:io';

import 'package:dio/dio.dart';
import 'package:musiclum/core/resources/data_state.dart';
import 'package:musiclum/core/sensitive.dart';
import 'package:musiclum/core/shared/data/data_sources/remote/api_service.dart';
import 'package:musiclum/core/shared/data/models/artist_model.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  SearchRepositoryImpl(this._apiService);

  final ApiService _apiService;  

  @override
  Future<DataState<List<ArtistModel>>> getArtists(String query) async {
    try{
      final response = await _apiService.searchArtists(
        query: query,
        type: 'artist',
        authToken: 'Authorization: Bearer $token'
      );

      if(response.response.statusCode == HttpStatus.ok){
        return DataSuccess(response.data);
      } else{
        return DataFailed(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions
          )
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}
