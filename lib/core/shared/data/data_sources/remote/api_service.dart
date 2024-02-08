import 'package:dio/dio.dart';
import 'package:musiclum/core/constants/api_constants.dart';
import 'package:musiclum/core/shared/data/models/artist_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiService{
  factory ApiService(Dio dio) = _ApiService;

  @GET('/search')
  Future<HttpResponse<List<ArtistModel>>> searchArtists({
    @Query('q') String query,
    @Query('type') String type,
    @Header('Authorization') String authToken,
  });
}
