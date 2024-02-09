import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/constants/navigator_constants.dart';
import 'package:musiclum/core/constants/ui_constants.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_network_image.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info/artist_info_bloc.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info/artist_info_event.dart';

class ArtistPreviewCard extends StatelessWidget {
  const ArtistPreviewCard({super.key, required this.artistName, required this.photoUrl, required this.imageSize, required this.artistEntity});

  final String photoUrl;
  final String artistName;
  final double imageSize;
  final ArtistEntity artistEntity;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      BlocProvider.of<ArtistInfoBloc>(context).add(GetArtistInfoEvent(
        artistId: artistEntity.id!,
        artistName: artistEntity.name ?? 'No name was provided',
        artistAvatar: artistEntity.images?[0].url ?? defaultAvatarUrl,
      ));
      Navigator.pushNamed(context, artistInfoScreen, arguments: artistEntity);
    },
    child: Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _NetworkImage(photoUrl: photoUrl, imageSize: imageSize),
            _ArtistName(artistName: artistName),
          ],
        ),
      ),
    ),
  );
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({required this.photoUrl, required this.imageSize});

  final String photoUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(15),
    child: ClipOval(
      child: CustomNetworkImage(
        photoUrl: photoUrl,
        imageSize: imageSize,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class _ArtistName extends StatelessWidget {
  const _ArtistName({required this.artistName});

  final String artistName;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Text(
      artistName,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}