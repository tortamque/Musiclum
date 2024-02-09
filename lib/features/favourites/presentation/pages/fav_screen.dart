import 'package:flutter/material.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/features/favourites/domain/entities/sorted_artist_entity.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late final List<SortedArtistEntity>? sortedArtists;

  @override
  void initState() {
    super.initState();
    sortedArtists = getIt<DBRepository>().getSortedArtists();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(
      title: 'Favorites',
    ),
    body: const Center(
      child: Text('Favorites'),
    )
  );
}
