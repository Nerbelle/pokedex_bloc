import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_bloc.dart';
import 'package:pokedex_bloc/blocs/pokemon_info_bloc/pokemon_info_event.dart';
import 'package:pokedex_bloc/repositories/pokemon_bloc_repository.dart';
import 'package:pokedex_bloc/screens/pokemon_info_page.dart';
import 'package:pokedex_bloc/screens/pokemon_list_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PokemonListPage.route:
        return MaterialPageRoute<void>(builder: (_) => const PokemonListPage());
      case PokemonInfoPage.route:
        final id = settings.arguments as String;
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => BlocProvider(
            create: (context) => PokemonInfoBloc(PokemonBlocRepository())..add(GetPokemonInfo(id)),
            child: const PokemonInfoPage(),
          ),
        );
      default:
        return MaterialPageRoute<void>(
            builder: (_) => Scaffold(body: Center(child: Text('Error: No route for ${settings.name}'))));
    }
  }
}
