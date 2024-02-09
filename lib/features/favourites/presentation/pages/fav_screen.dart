import 'package:flutter/material.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(
      title: 'Favorites',
    ),
    body: const Center(
      child: Text('Favorites'),
    )
  );
}
