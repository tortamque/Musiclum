import 'package:equatable/equatable.dart';

class AlbumCoverEntity extends Equatable {
  final String url;
  final int height;
  final int width;

  const AlbumCoverEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  List<Object> get props => [url, height, width];
}

