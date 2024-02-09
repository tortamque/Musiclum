import 'package:equatable/equatable.dart';

sealed class ArtistInfoEvent extends Equatable {
  const ArtistInfoEvent();

  @override
  List<Object> get props => [];
}

final class GetArtistInfoEvent extends ArtistInfoEvent{
  const GetArtistInfoEvent({required this.artistName, required this.artistAvatar, required this.artistId});

  final String artistId;
  final String artistName;
  final String artistAvatar;
}
