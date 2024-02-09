import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/constants/ui_constants.dart';
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
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Loading... This may take a while 🥱',
                      style: const TextStyle(
                        fontSize: 20,
                      )
                    ),
                  ),
                ],
              ),
            );
          } 
          if(state is GetArtistInfoError){
            return const Center(child: Text('Opps 😔! Something went wrong. Try again.'),);
          }
          if(state is GetArtistInfoDone){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: ListView.builder(
                itemCount: state.albums!.length,
                itemBuilder: (context, index){
                  final album = state.albums![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              album.albumCoverUrl,
                              width: 250,
                              height: 250,
                            ),
                          ),

                          const SizedBox(height: 20),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  artistEntity.images!.isNotEmpty
                                    ? artistEntity.images![0].url ?? defaultAvatarUrl
                                    : defaultAvatarUrl,
                                  width: 65,
                                  height: 65,
                                ),
                              ),

                              Text(
                                artistEntity.name ?? 'Anonymous Artist',
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: album.songs.map(
                                (song) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                                  child: Text(
                                    '${song.index}) ${song.title} | ${song.durationMs ~/ 60000}:${(song.durationMs % 60000 ~/ 1000).toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    )
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
