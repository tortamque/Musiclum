import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:musiclum/core/constants/ui_constants.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_network_image.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_bloc.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_state.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({super.key});

  @override
  Widget build(BuildContext context){
    final artistEntity = ModalRoute.of(context)!.settings.arguments as ArtistEntity;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Artist Info'),
      body: BlocBuilder<ArtistInfoBloc, ArtistInfoState>(
        builder: (context, state) {
          if(state is GetArtistInfoLoading){
            return _bodyLoading(context);
          } 
          if(state is GetArtistInfoError){
            return _bodyError();
          }
          if(state is GetArtistInfoDone){
            return _bodySuccessful(
              state: state,
              artistEntity: artistEntity,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _bodyLoading(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Loading... This may take a while 🥱',
            style: TextStyle(
              fontSize: 20,
            )
          ),
        ),
      ],
    ),
  );

  Widget _bodyError() => const Center(child: Text('Opps 😔! Something went wrong. Try again.'));

  Widget _bodySuccessful({required GetArtistInfoDone state, required ArtistEntity artistEntity}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: ListView.builder(
      itemCount: state.albums!.length,
      itemBuilder: (context, index){
        final album = state.albums![index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _AlbumCover(albumCoverUrl: album.albumCoverUrl),
                const _Divider(),
                _ArtistInfo(
                  avatarUrl: artistEntity.images!.isNotEmpty
                    ? artistEntity.images![0].url ?? defaultAvatarUrl
                    : defaultAvatarUrl,
                  name: artistEntity.name ?? 'Anonymous Artist',
                ),
                const _Divider(),
                _SongList(songs: album.songs),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class _AlbumCover extends StatelessWidget {
  const _AlbumCover({required this.albumCoverUrl});

  final String albumCoverUrl;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: CustomNetworkImage(
      photoUrl: albumCoverUrl,
      imageSize: 250,
    ),
  );
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => const SizedBox(height: 20);
}

class _ArtistInfo extends StatelessWidget {
  const _ArtistInfo({required this.avatarUrl, required this.name});

  final String avatarUrl;
  final String name;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ClipOval(
          child: CustomNetworkImage(
            photoUrl: avatarUrl,
            imageSize: 65,
          ),
        ),
        const SizedBox(width: 30),
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    ),
  );
}

class _SongList extends StatelessWidget {
  const _SongList({required this.songs});

  final List<ParsedSongEntity> songs;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: songs.map(
        (song) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  '${song.index}) ${song.title} | ${song.durationMs ~/ 60000}:${(song.durationMs % 60000 ~/ 1000).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 18,
                  )
                ),
                LikeButton(
                  circleColor: CircleColor(
                    start: Theme.of(context).colorScheme.primary,
                    end: Theme.of(context).colorScheme.onPrimary,
                  ),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Theme.of(context).colorScheme.primary,
                    dotSecondaryColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  likeBuilder: (isLiked) => Icon(
                    Icons.bookmark_outlined,
                    color: isLiked ? Theme.of(context).colorScheme.primary : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ).toList(),
    ),
  );
}
