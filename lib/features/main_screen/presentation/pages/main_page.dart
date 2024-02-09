import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/constants/navigator_constants.dart';
import 'package:musiclum/core/constants/ui_constants.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/search_artists_bloc.dart';
import 'package:musiclum/features/main_screen/presentation/widgets/artist_preview_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Home'),
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        if(index == 1){
          Navigator.pushNamed(context, favouritesScreen);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_rounded),
          label: 'Favorites',
        ),
      ],
    ),
    body: BlocBuilder<SearchArtistsBloc, SearchState>(
      builder: (context, state) {
        if(state is SearchArtistsLoading){
          return _bodyLoading();
        } 
        if(state is SearchArtistsError){
          return _bodyError();
        }
        if(state is SearchArtistsDone){
          return _bodySuccessful(state);
        }

        return const SizedBox();
      },
    ),
  );

  Widget _bodySuccessful(SearchArtistsDone state)=> Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    child: ListView.builder(
      itemCount: state.artists!.length + 1,
      itemBuilder: (context, index){
        if(index == 0){
          return _CustomSearchBar();
        } else{
          final artistIndex = index - 1;
          
          return ArtistPreviewCard(
            photoUrl: state.artists![artistIndex].images!.isNotEmpty
              ? state.artists![artistIndex].images![0].url ?? defaultAvatarUrl
              : defaultAvatarUrl,
            artistName: state.artists![artistIndex].name ?? 'No name found',
            imageSize: 75,
            artistEntity: state.artists![artistIndex],
          );
        }
      },
    ),
  );

  Widget _bodyError() => Column(
    children: [
      _CustomSearchBar(),
      const Text('Opps 😔! Something went wrong. Try again.'),
    ],
  );

  Widget _bodyLoading() => const Center(
    child: CircularProgressIndicator(),
  );
}

class _CustomSearchBar extends StatelessWidget {
  _CustomSearchBar();

  final TextEditingController _controller = TextEditingController();

  void _searchArtist(String value, BuildContext context){
    if(value.isNotEmpty){
      BlocProvider.of<SearchArtistsBloc>(context).add(SearchArtistsEvent(query: value.trim()));
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: SearchBar(
      controller: _controller,
      hintText: 'Search for an artists by name',
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => _searchArtist(_controller.text, context),
      ),
      onSubmitted: (value) => _searchArtist(value, context),
    ),
  );
}
