abstract class PokemonInfoEvent {}

class GetPokemonInfo extends PokemonInfoEvent {
  final String id;

  GetPokemonInfo(this.id);
}
