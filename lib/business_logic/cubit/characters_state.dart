part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

class Characterserror extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Characters> characters;
  CharactersLoaded(this.characters);
}

final class CharactersInitial extends CharactersState {}

class LocationsLoaded extends CharactersState {
  final List<Location> locations;
  LocationsLoaded(this.locations);
}
