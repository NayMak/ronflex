class Pokemon {
  String name;
  int level;
  String ability;

  Pokemon({required this.name, required this.level, required this.ability});

  changeAbility(String newAbility) {
    ability = newAbility;
  }

  levelUp() {
    if (level < 100) {
      level++;
    }
  }
}
