import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_state.dart';
import 'package:pokedex_bloc/utiities/constants.dart';
import 'package:pokedex_bloc/utiities/string_ext.dart';
import 'package:pokedex_bloc/widgets/text_widget.dart';

class PokemonInfoPage extends StatelessWidget {
  static const String route = '/info';

  const PokemonInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const defaultSpacing = SizedBox(height: 10.0);

    return BlocBuilder<PokemonInfoBloc, PokemonInfoState>(builder: (context, state) {
      if (state is PokemonInfoLoadedState) {
        final pokemonId = '${state.pokemon.id}';
        final pokemonStats = state.pokemon.stats;

        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: defaultPadding,
              child: TextWidget(
                state.pokemon.name.capitalize,
                fontSize: 24.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        pokemonId.getImageUrl(id: pokemonId),
                        height: imageHeight,
                        width: imageWidth,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  defaultSpacing,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget('Height: ${state.pokemon.height} m'),
                      TextWidget('Weight: ${state.pokemon.weight} kg'),
                    ],
                  ),
                  defaultSpacing,
                  const Divider(height: 1.0, color: Colors.black),
                  defaultSpacing,
                  const TextWidget('Stats:'),
                  defaultSpacing,
                  ...pokemonStats.map((stat) {
                    final baseStat = stat.baseStat;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(stat.statName.name.capitalize),
                            TextWidget('$baseStat'),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: baseStat / 100.0,
                          color: colorList[pokemonStats.indexOf(stat)],
                          minHeight: 10.0,
                        ),
                        defaultSpacing,
                      ],
                    );
                  }),
                ]),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
    });
  }
}
