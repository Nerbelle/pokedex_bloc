import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_event.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_state.dart';
import 'package:pokedex_bloc/repositories/pokemon_bloc_repository.dart';

class PokemonInfoBloc extends Bloc<PokemonInfoEvent, PokemonInfoState> {
  final PokemonBlocRepository _pokemonBlocRepository;

  PokemonInfoBloc(this._pokemonBlocRepository) : super(PokemonInfoLoadingState()) {
    on<GetPokemonInfo>(_getPokemonInfo);
  }

  Future<void> _getPokemonInfo(GetPokemonInfo event, Emitter<PokemonInfoState> emit) async {
    final pokemon = await _pokemonBlocRepository.getPokemon(event.id);

    return emit(PokemonInfoLoadedState(pokemon));
  }
}
