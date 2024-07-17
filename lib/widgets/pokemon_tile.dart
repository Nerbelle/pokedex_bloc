import 'package:flutter/material.dart';
import 'package:pokedex_bloc/utiities/string_ext.dart';
import 'package:pokedex_bloc/models/pokemon.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    pokemon.url.getImageUrl(),
                    height: 75.0,
                    width: 75.0,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Text(
                pokemon.name.capitalize,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
}
