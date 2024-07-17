import 'package:equatable/equatable.dart';
import 'package:pokedex_bloc/models/pokemon_info.dart';

abstract class PokemonInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInfoLoadingState extends PokemonInfoState {}

class PokemonInfoLoadedState extends PokemonInfoState {
  final PokemonInfo pokemon;

  PokemonInfoLoadedState(this.pokemon);

  @override
  List<Object> get props => [pokemon];

  PokemonInfoLoadedState copyWith({PokemonInfo? pokemon}) {
    return PokemonInfoLoadedState(pokemon ?? this.pokemon);
  }
}

class PokemonInfoErrorState extends PokemonInfoState {
  final String message;

  PokemonInfoErrorState(this.message);

  @override
  List<Object> get props => [message];
}
