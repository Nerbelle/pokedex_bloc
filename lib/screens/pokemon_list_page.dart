import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_state.dart';
import 'package:pokedex_bloc/screens/pokemon_info_page.dart';
import 'package:pokedex_bloc/utiities/string_ext.dart';
import 'package:pokedex_bloc/widgets/pokemon_tile.dart';
import 'package:pokedex_bloc/utiities/constants.dart';

class PokemonListPage extends StatefulWidget {
  static const String route = '/';

  const PokemonListPage({
    super.key,
  });

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels + 10.0 >= _scrollController.position.maxScrollExtent) {
      context.read<PokemonListBloc>().add(GetPokemonList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: defaultPadding,
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              context.read<PokemonListBloc>().add(SearchPokemon(query));
            },
            decoration: const InputDecoration(
              hintText: "Search Pokémon",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PokemonListBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PokemonLoadedState) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: listCross,
                      childAspectRatio: listWidth / listHeight,
                      crossAxisSpacing: listWidth,
                      mainAxisSpacing: listWidth,
                    ),
                    controller: _scrollController,
                    padding: defaultPadding,
                    itemCount: state.filteredList.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.filteredList[index];

                      return PokemonTile(
                        pokemon: pokemon,
                        onTap: () => Navigator.of(context).pushNamed(
                          PokemonInfoPage.route,
                          arguments: pokemon.url.getId,
                        ),
                      );
                    },
                  );
                } else if (state is PokemonErrorState) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
