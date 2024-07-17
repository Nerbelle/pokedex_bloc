import 'package:pokedex_bloc/models/pokemon.dart';
import 'package:pokedex_bloc/models/pokemon_info.dart';
import 'package:pokedex_bloc/services/pokemon_api_service.dart';

class PokemonBlocRepository {
  PokemonBlocRepository({ApiService? apiService}) : _apiService = ApiService();

  final ApiService _apiService;

  Future<List<Pokemon>> getPokemonList(String? offset, String? limit) async {
    final pokemonList = await _apiService.pokemonApi.getPokemonList(offset, limit);

    return pokemonList;
  }

  Future<PokemonInfo> getPokemon(String id) async => await _apiService.pokemonApi.getPokemonDetails(id);
}
