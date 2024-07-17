import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_bloc/models/pokemon_stats.dart';

part 'pokemon_info.g.dart';

@JsonSerializable()
class PokemonInfo {
  const PokemonInfo({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'height')
  final double height;
  @JsonKey(name: 'weight')
  final double weight;
  @JsonKey(name: 'stats')
  final List<PokemonStats> stats;
}
