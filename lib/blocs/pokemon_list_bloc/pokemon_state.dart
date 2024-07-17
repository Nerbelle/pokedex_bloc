import 'package:equatable/equatable.dart';
import 'package:pokedex_bloc/models/pokemon.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final List<Pokemon> pokemonList;
  final List<Pokemon> filteredList;

  PokemonLoadedState(
    this.pokemonList,
    this.filteredList,
  );

  @override
  List<Object> get props => [pokemonList, filteredList];

  PokemonLoadedState copyWith({
    List<Pokemon>? pokemonList,
    List<Pokemon>? filteredList,
  }) {
    return PokemonLoadedState(
      pokemonList ?? this.pokemonList,
      filteredList ?? this.filteredList,
    );
  }
}

class PokemonErrorState extends PokemonState {
  final String message;

  PokemonErrorState(this.message);

  @override
  List<Object> get props => [message];
}
