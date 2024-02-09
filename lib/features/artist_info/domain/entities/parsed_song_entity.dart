import 'package:equatable/equatable.dart';

class ParsedSongEntity extends Equatable{
  const ParsedSongEntity({required this.title, required this.durationMs, required this.index});

  final String title;
  final int durationMs;
  final int index;
  
  @override
  List<Object?> get props => [title, durationMs];
}
