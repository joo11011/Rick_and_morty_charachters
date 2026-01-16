import 'package:bloc/bloc.dart';
import '../../data/models/characters.dart';
import '../../data/models/location.dart';
import '../../data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Characters> characters = [];
  List<Location> locations = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllcharacters() async {
    try {
      emit(CharactersInitial());
      final charactersList = await charactersRepository.getAllcharacters();
      characters = charactersList;
      emit(CharactersLoaded(charactersList));
    } catch (e) {
      emit(Characterserror());
    }
  }

  void getAlllocations() async {
    try {
      emit(CharactersInitial());
      final locationList = await charactersRepository.getAllLocations();
      locations = locationList;
      emit(LocationsLoaded(locationList));
    } catch (e) {
      emit(Characterserror());
    }
  }
}
