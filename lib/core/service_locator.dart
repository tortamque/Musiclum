import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musiclum/core/constants/hive_constants.dart';
import 'package:musiclum/core/shared/data/data_sources/local/database_service.dart';
import 'package:musiclum/core/shared/data/data_sources/remote/api_service.dart';
import 'package:musiclum/core/shared/data/repository/search_repository_impl.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_cover_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_album_details_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/get_albums_usecase.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info/artist_info_bloc.dart';
import 'package:musiclum/features/main_screen/domain/usecases/search_artists_usecase.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/search_artists_bloc.dart';

GetIt getIt = GetIt.instance;
Future<void> initializeDependencies() async{
await _initializeHive();

var box = await _initializeBox();
  getIt
    // Hive
    ..registerSingleton<Box<dynamic>>(box)

    // Dio
    ..registerSingleton<Dio>(Dio())

    // Api Service
    ..registerSingleton<ApiService>(ApiService(getIt()))

    // Database Service
    ..registerSingleton<DatabaseService>(DatabaseServiceImpl(getIt()))

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

Future<void> _initializeHive() async {
  await Hive.initFlutter();

  // Adapters
  Hive.registerAdapter(ParsedAlbumEntityAdapter());
  Hive.registerAdapter(ParsedSongEntityAdapter());
}

Future<Box<dynamic>> _initializeBox() async => Hive.openBox(songsBox);
