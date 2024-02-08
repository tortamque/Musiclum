import 'package:flutter/material.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(title: 'Artist Info'),
    body: Placeholder(),
  );
}
