import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/models/characters.dart';
import 'package:breaking_bad_app/data/models/quote.dart';
import 'package:breaking_bad_app/data/repository/characters_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Characters> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
List<Characters> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters.cast<Characters>();
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }

}
