import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_network_image.dart';
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
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: sortedArtists == null
        ? const Center(
          child: Text(
            'You have no favorites yet 😇',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
        : ListView.builder(
            itemCount: sortedArtists!.length,
            itemBuilder: (context, index) {
              final artist = sortedArtists![index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomNetworkImage(
                                photoUrl: artist.imageUrl, 
                                imageSize: 50,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              artist.name,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),

                      Column(
                        children: artist.songs.mapIndexed(
                          (index, song) => Row(
                            children: [
                              Text('$index) '),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomNetworkImage(
                                  photoUrl: song.albumCoverUrl,
                                  imageSize: 70,
                                ),
                              ),
                              Text("${song.title} | ${song.durationMs ~/ 60000}:${(song.durationMs % 60000 ~/ 1000).toString().padLeft(2, '0')}"),
                              
                            ],
                          ),
                        ).toList()
                      )
                    ],
                  ),
                ),
              );
            },
          )
    ),
  );
}
