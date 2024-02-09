import 'package:musiclum/features/favourites/domain/entities/sorted_artist_entity.dart';

abstract class DBRepository{
  bool isSongAlreadySaved({required String songName, required String albumName, required String artistName});
  List<SortedArtistEntity>? getSortedArtists();
}
