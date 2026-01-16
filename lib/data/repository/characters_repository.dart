// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_with_omar_ahmed/data/models/characters.dart';
import 'package:bloc_with_omar_ahmed/data/models/location.dart';
import 'package:bloc_with_omar_ahmed/data/web_services/characters_api.dart';

class CharactersRepository {
  final CharactersApi charactersApi;
  CharactersRepository({ required this.charactersApi});

  Future<List<Characters>> getAllcharacters() async {
    final characters = await charactersApi.getAllcharacters();
    return characters.map((character) => Characters.fromJson(character)).toList();
  }
   Future<List<Location>> getAllLocations() async {
    final locations = await charactersApi.getAllLocations();
    return locations.map((qoute) => Location.fromJson(qoute)).toList();
  }
}
