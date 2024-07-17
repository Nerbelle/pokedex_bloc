import 'package:flutter/material.dart';
import 'package:pokedex_bloc/pokedex_app.dart';
import 'package:pokedex_bloc/repositories/pokemon_bloc_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PokedexApp(pokemonBlocRepository: PokemonBlocRepository()));
}
