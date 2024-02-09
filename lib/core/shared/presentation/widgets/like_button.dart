import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:musiclum/core/service_locator.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_album_entity.dart';
import 'package:musiclum/core/shared/domain/entities/hive/parsed_song_entity.dart';
import 'package:musiclum/core/shared/domain/usecases/delete_song_usecase.dart';
import 'package:musiclum/core/shared/domain/usecases/save_song_usecase.dart';
import 'package:musiclum/features/artist_info/domain/usecases/is_song_saved_usecase.dart';

class CustomLikeButton extends StatelessWidget {
  const CustomLikeButton({
    super.key, 
    required this.songName, 
    required this.albumName, 
    required this.artistName, 
    required this.onSave, 
    required this.song, 
    required this.album, 
    required this.onDelete, required this.onSaveParams, required this.onDeleteParams,
  });

  final String songName;
  final String albumName;
  final String artistName;
  final ParsedSongEntity song;
  final ParsedAlbumEntity album;
  final Future<void> Function(SaveSongUseCaseParams params) onSave;
  final SaveSongUseCaseParams onSaveParams;
  final Future<void> Function(DeleteSongUseCaseParams params) onDelete;
  final DeleteSongUseCaseParams onDeleteParams;

  @override
  Widget build(BuildContext context) => LikeButton(
    isLiked: getIt<IsSongSavedUseCase>()(
      IsSongSavedParams(
        songName: songName,
        albumName: albumName,
        artistName: artistName,
      ),
    ),
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
    onTap: (isLiked) async {
      if(isLiked == false){
        await onSave(onSaveParams,);
      } else{
        await onDelete(onDeleteParams,);
      }

      return !isLiked;
    },
  );
}
