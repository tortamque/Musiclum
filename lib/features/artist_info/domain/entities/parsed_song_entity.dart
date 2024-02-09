import 'package:equatable/equatable.dart';

class ParsedSongEntity extends Equatable{
  const ParsedSongEntity({required this.title, required this.durationMs});

  final String title;
  final int durationMs;
  
  @override
  List<Object?> get props => [title, durationMs];
}
