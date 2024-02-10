import 'package:equatable/equatable.dart';

class AlbumCoverEntity extends Equatable {
  const AlbumCoverEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  final String url;
  final int height;
  final int width;

  @override
  List<Object> get props => [url, height, width];
}
