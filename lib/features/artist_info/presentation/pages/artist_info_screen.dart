import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_bloc.dart';
import 'package:musiclum/features/artist_info/presentation/bloc/artist_info_state.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({super.key});

  @override
  Widget build(BuildContext context){
    final artistEntity = ModalRoute.of(context)!.settings.arguments as ArtistEntity;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Artist Info'),
      body: BlocBuilder<ArtistInfoBloc, ArtistInfoState>(
        builder: (context, state) {
          if(state is GetArtistInfoLoading){
            return const Center(child: CircularProgressIndicator());
          } 
          if(state is GetArtistInfoError){
            return Text('error');
          }
          if(state is GetArtistInfoDone){
            return ListView.builder(
              itemCount: state.albums!.length,
              itemBuilder: (context, index){
                final album = state.albums![index];
                return Column(
                  children: [
                    Image.network(album.albumCoverUrl),
                    Column(
                      children: album.songs.map((song) => Text('${song.title} + ${song.durationMs}')).toList(),
                    )
                  ],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
