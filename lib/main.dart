import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/config/theme/app_theme.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/bloc/search_bloc.dart';
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
      BlocProvider<SearchBloc>(create: (context) => getIt<SearchBloc>()..add(const SearchArtistsEvent(query: 'Rock'))),
    ],
    child: MaterialApp(
        theme: theme(colorPrimary),
        home: MainPage(),
      ),
  );
}
