import 'package:pokedex_bloc/services/pokemon_api_client.dart';
import 'package:pokedex_bloc/services/pokemon_api_handler.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  late final Uri _baseUri = Uri.parse(ApiClient.baseUrl);

  PokemonApi? _pokemonApi;

  PokemonApi get pokemonApi => _pokemonApi ??= PokemonApi(_apiClient, _baseUri);
}
