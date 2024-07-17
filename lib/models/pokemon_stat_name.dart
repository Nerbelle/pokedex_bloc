import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stat_name.g.dart';

@JsonSerializable()
class PokemonStatName {
  const PokemonStatName({
    required this.name,
    required this.url,
  });

  factory PokemonStatName.fromJson(Map<String, dynamic> json) => _$PokemonStatNameFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatNameToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'url')
  final String url;
}
