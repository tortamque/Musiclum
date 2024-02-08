import 'package:flutter/material.dart';
import 'package:musiclum/core/shared/presentation/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Home'),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _CustomSearchBar(),
        ],
      ),
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
