class SortedArtistEntity{
  SortedArtistEntity({required this.name, required this.imageUrl, required this.songs});

  final String name;
  final String imageUrl;
  final List<SortedSongEntity> songs;
}

class SortedSongEntity{
  SortedSongEntity({required this.albumCoverUrl, required this.title, required this.durationMs});

  final String albumCoverUrl;
  final String title;
  final int durationMs;
}
