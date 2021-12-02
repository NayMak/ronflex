import 'package:flutter/widgets.dart';
import 'package:ronflex_flutter/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier {
  Pokemon pokemon;

  PokemonProvider(this.pokemon);

  changeAbility(String newAbility) {
    pokemon.changeAbility(newAbility);
    notifyListeners();
  }

  levelUp() {
    pokemon.levelUp();
    notifyListeners();
  }
}
