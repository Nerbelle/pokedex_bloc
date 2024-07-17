import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_bloc/models/pokemon_stat_name.dart';

part 'pokemon_stats.g.dart';

@JsonSerializable()
class PokemonStats {
  const PokemonStats({
    required this.baseStat,
    required this.statName,
  });

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatsToJson(this);

  @JsonKey(name: 'base_stat')
  final double baseStat;
  @JsonKey(name: 'stat')
  final PokemonStatName statName;
}
