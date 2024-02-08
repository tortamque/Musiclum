import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/config/theme/app_theme.dart';
import 'package:musiclum/core/constants/navigator_constants.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/features/artist_info/presentation/pages/artist_info_screen.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/bloc/search_artists_bloc.dart';
import 'package:musiclum/features/main_screen/presentation/pages/main_page.dart';

void main() {
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      // Execute
      BlocProvider<SearchArtistsBloc>(create: (context) => getIt<SearchArtistsBloc>()..add(const SearchArtistsEvent(query: 'Rock'))),
    ],
    child: MaterialApp(
      theme: theme(colorPrimary),
      initialRoute: mainScreen,
      routes: {
        mainScreen: (context) => const MainPage(),
        artistInfoScreen: (context) => const ArtistInfoScreen(),
      },
    ),
  );
}
