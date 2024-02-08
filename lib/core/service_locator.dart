import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:musiclum/core/shared/data/data_sources/remote/api_service.dart';
import 'package:musiclum/core/shared/data/repository/search_repository_impl.dart';
import 'package:musiclum/core/shared/domain/repository/search_repository.dart';
import 'package:musiclum/features/main_screen/domain/usecases/search_artists_usecase.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/bloc/search_bloc.dart';

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

    // Bloc
    ..registerFactory<SearchBloc>(() => SearchBloc(getIt()));
}
