import 'business_logic/cubit/characters_cubit.dart';
import 'constants/strings.dart';
import 'data/models/characters.dart' as models;
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_api.dart';
import 'presentation/screens/characters_details.dart';
import 'presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRoutes() {
    charactersRepository = CharactersRepository(charactersApi: CharactersApi());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case charactersDetailsScreen:
        final character = settings.arguments as models.Characters;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharactersCubit(charactersRepository),
            child: CharactersDetailsScreen(character: character),
          ),
        );
    }
    return null;
  }
}
