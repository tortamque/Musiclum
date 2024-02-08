import 'package:flutter/material.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({super.key});

  @override
  Widget build(BuildContext context){
    final artistEntity = ModalRoute.of(context)!.settings.arguments as ArtistEntity;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Artist Info'),
      body: Text(artistEntity.name),
    );
  }
}
