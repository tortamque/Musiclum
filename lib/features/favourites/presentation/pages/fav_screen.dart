import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/core/shared/domain/repository/db_repository.dart';
import 'package:musiclum/core/shared/domain/usecases/delete_song_usecase.dart';
import 'package:musiclum/core/shared/domain/usecases/save_song_usecase.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_network_image.dart';
import 'package:musiclum/core/shared/presentation/widgets/like_button.dart';
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
    appBar: const CustomAppBar(
      title: 'Favorites',
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: sortedArtists == null || sortedArtists!.isEmpty
        ? _bodyEmpty()
        : _bodySuccessful(),
    ),
  );

  Widget _bodyEmpty() => const Center(
    child: Text(
      'You have no favorites yet 😇',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );

  Widget  _bodySuccessful() => ListView.builder(
    itemCount: sortedArtists!.length,
    itemBuilder: (context, index) {
      final artist = sortedArtists![index];

      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ArtistInfo(imageUrl: artist.imageUrl, name: artist.name),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: artist.songs.mapIndexed(
                  (index, song) => _SongCard(index: index, song: song, artist: artist),
                ).toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _Index extends StatelessWidget {
  const _Index({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => Text(
    '${index + 1}) ',
    style: const TextStyle(
      fontSize: 18,
    ),
  );
}

class _AlbumCover extends StatelessWidget {
  const _AlbumCover({required this.albumCoverUrl});

  final String albumCoverUrl;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: CustomNetworkImage(
      photoUrl: albumCoverUrl,
      imageSize: 70,
    ),
  );
}

class _SongInfo extends StatelessWidget {
  const _SongInfo({required this.title, required this.durationMs});

  final String title;
  final int durationMs;

  @override
  Widget build(BuildContext context) => Text(
    "$title | ${durationMs ~/ 60000}:${(durationMs % 60000 ~/ 1000).toString().padLeft(2, '0')}",
    style: const TextStyle(
      fontSize: 18,
    ),
  );
}

class _SongCard extends StatelessWidget {
  const _SongCard({required this.index, required this.song, required this.artist});

  final int index;
  final SortedSongEntity song;
  final SortedArtistEntity artist;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _Index(index: index + 1),
          const SizedBox(width: 10),
          _AlbumCover(albumCoverUrl: song.albumCoverUrl),
          const SizedBox(width: 10),
          _SongInfo(durationMs: song.durationMs, title: song.title),
          const SizedBox(width: 10),
          CustomLikeButton(
            songName: song.title, 
            albumName: artist.songs[index].albumName, 
            artistName: artist.name, 
            onSave: getIt<SaveSongUseCase>(), 
            onDelete: getIt<DeleteSongUseCase>(), 
            onSaveParams: SaveSongUseCaseParams(
              parsedSongEntity: ParsedSongEntity(title: song.title, durationMs: song.durationMs), 
              parsedAlbumEntity: ParsedAlbumEntity(
                albumCoverUrl: song.albumCoverUrl, 
                songs: artist.songs.map((e) => ParsedSongEntity(title: song.title, durationMs: song.durationMs)).toList(), 
                albumName: song.albumName, 
                artistName: artist.name, 
                artistAvatar: artist.imageUrl,
              ),
            ), 
            onDeleteParams: DeleteSongUseCaseParams(
              songName: song.title, 
              albumName: song.albumName, 
              artistName: artist.name,
            ),
            song: ParsedSongEntity(title: song.title, durationMs: song.durationMs), 
            album: ParsedAlbumEntity(
              albumCoverUrl: song.albumCoverUrl, 
              songs: artist.songs.map((e) => ParsedSongEntity(title: song.title, durationMs: song.durationMs)).toList(), 
              albumName: song.albumName, 
              artistName: artist.name, 
              artistAvatar: artist.imageUrl,
            ), 
          ),
        ],
      ),
    ),
  );
}

class _ArtistInfo extends StatelessWidget {
  const _ArtistInfo({required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipOval(
        child: CustomNetworkImage(
          photoUrl: imageUrl, 
          imageSize: 75,
        ),
      ),
      const SizedBox(width: 30),
      SizedBox(
        width: 150,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ],
  );
}
