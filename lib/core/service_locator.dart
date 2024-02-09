import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:musiclum/core/shared/data/data_sources/remote/api_service.dart';
import 'package:musiclum/core/shared/data/repository/search_repository_impl.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_cover_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_details_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_albums_usecase.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_bloc.dart';
import 'package:musiclum/features/main_screen/domain/usecases/search_artists_usecase.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/search_artists_bloc.dart';

GetIt getIt = GetIt.instance;
void initializeDependencies() {
  getIt
    // Dio
    ..registerSingleton<Dio>(Dio())

    // Api Service
    ..registerSingleton<ApiService>(ApiService(getIt()))

    // Repository
    ..registerSingleton<SearchRepository>(SearchRepositoryImpl(getIt()))

    // Use Case
    ..registerSingleton<SearchArtistsUseCase>(SearchArtistsUseCase(getIt()))
    ..registerSingleton<GetAlbumsUseCase>(GetAlbumsUseCase(getIt()))
    ..registerSingleton<GetAlbumDetailsUseCase>(GetAlbumDetailsUseCase(getIt()))
    ..registerSingleton<GetAlbumCoverUseCase>(GetAlbumCoverUseCase(getIt()))

    // Bloc
    ..registerFactory<SearchArtistsBloc>(() => SearchArtistsBloc(getIt()))
    ..registerFactory<ArtistInfoBloc>(() => ArtistInfoBloc(getIt(), getIt(), getIt()));
}
