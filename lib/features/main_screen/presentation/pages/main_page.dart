import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:musiclum/features/main_screen/presentation/bloc/bloc/search_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Home'),
    body: BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if(state is SearchArtistsLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } 
        if(state is SearchArtistsError){
          print(state.error);
          return Column(
            children: [
              _CustomSearchBar(),
              const Text('Opps 😔! Something went wrong. Try again.'),
            ],
          );
        }
        if(state is SearchArtistsDone){
          return Column(
            children: [
              _CustomSearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.artists!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.artists![index].name),
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    )
  );
}

class _CustomSearchBar extends StatelessWidget {
  _CustomSearchBar();

  final TextEditingController _controller = TextEditingController();

  void _searchArtist(String value){
    print(value);
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: SearchBar(
      controller: _controller,
      hintText: 'Search for an artists by name',
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => _searchArtist(_controller.text),
      ),
      onSubmitted: (value) => _searchArtist(value),
    ),
  );
}
