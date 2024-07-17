import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_state.dart';
import 'package:pokedex_bloc/screens/pokemon_list_page.dart';
import 'package:pokedex_bloc/repositories/pokemon_bloc_repository.dart';
import 'package:pokedex_bloc/utiities/app_router.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({required PokemonBlocRepository pokemonBlocRepository, super.key})
      : _pokemonBlocRepository = pokemonBlocRepository;

  final PokemonBlocRepository _pokemonBlocRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _pokemonBlocRepository,
      child: BlocProvider(
        create: (_) => PokemonListBloc(_pokemonBlocRepository)..add(GetPokemonList()),
        child: const PokedexAppView(),
      ),
    );
  }
}

class PokedexAppView extends StatelessWidget {
  const PokedexAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonState>(
      builder: (context, state) => MaterialApp(
        home: Builder(
          builder: (context) {
            return PopScope(
              canPop: true,
              child: Navigator(
                key: navigatorKey,
                initialRoute: PokemonListPage.route,
                onGenerateRoute: AppRouter().generateRoute,
              ),
            );
          },
        ),
      ),
    );
  }
}
