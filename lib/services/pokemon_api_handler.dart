import 'package:pokedex_bloc/models/pokemon.dart';
import 'package:pokedex_bloc/models/pokemon_info.dart';
import 'package:pokedex_bloc/services/pokemon_api_client.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  final ApiClient apiClient;
  final Uri baseUri;

  PokemonApi(
    this.apiClient,
    this.baseUri,
  );

  Future<List<Pokemon>> getPokemonList(String? offset, String? limit) async {
    final queryParams = <String, dynamic>{};

    if (limit != null) queryParams['limit'] = limit;

    if (offset != null) queryParams['offset'] = offset;

    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon');
    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['results'].map<Pokemon>((dynamic data) => Pokemon.fromJson(data as Json)).toList();
    });
  }

  Future<PokemonInfo> getPokemonDetails(String id) async {
    final queryParams = <String, dynamic>{};

    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/$id');

    return await apiClient.dio.getUri(uri).then((response) => PokemonInfo.fromJson(response.data));
  }
}
