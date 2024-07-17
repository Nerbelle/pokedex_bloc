import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokedex_bloc/blocs/pokemon_list_bloc/pokemon_state.dart';
import 'package:pokedex_bloc/repositories/pokemon_bloc_repository.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonState> {
  final PokemonBlocRepository _pokemonBlocRepository;

  PokemonListBloc(this._pokemonBlocRepository) : super(PokemonLoadingState()) {
    on<GetPokemonList>(_getPokemonList);
    on<SearchPokemon>(_searchPokemon);
  }

  Future<void> _getPokemonList(PokemonListEvent event, Emitter<PokemonState> emit) async {
    if (state is PokemonLoadedState) {
      final currentPokemonList = (state as PokemonLoadedState).pokemonList;
      final newPokemonList = await _pokemonBlocRepository.getPokemonList(
          '${currentPokemonList.isNotEmpty ? currentPokemonList.length : 0}', '20');
      final updatedPokemonList = [...currentPokemonList, ...newPokemonList];

      return emit(PokemonLoadedState(updatedPokemonList, updatedPokemonList));
    }

    final pokemonList = await _pokemonBlocRepository.getPokemonList('0', '20');
    return emit(PokemonLoadedState(pokemonList, pokemonList));
  }

  Future<void> _searchPokemon(SearchPokemon event, Emitter<PokemonState> emit) async {
    final pokemonState = state as PokemonLoadedState;

    final filteredPokemon = pokemonState.pokemonList.where((pokemon) => pokemon.name.contains(event.query)).toList();
    emit(pokemonState.copyWith(filteredList: event.query.isNotEmpty ? filteredPokemon : pokemonState.pokemonList));
  }
}
