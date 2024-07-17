abstract class PokemonListEvent {}

class GetPokemonList extends PokemonListEvent {
  final String? offset;
  final String? limit;

  GetPokemonList({this.offset, this.limit});
}

class SearchPokemon extends PokemonListEvent {
  final String query;

  SearchPokemon(this.query);
}
