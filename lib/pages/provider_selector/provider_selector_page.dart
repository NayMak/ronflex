import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ronflex_flutter/models/pokemon.dart';
import 'package:ronflex_flutter/providers/pokemon_provider.dart';

class ProviderSelectorPage extends StatefulWidget {
  const ProviderSelectorPage({Key? key}) : super(key: key);

  @override
  _ProviderSelectorPageState createState() => _ProviderSelectorPageState();
}

class _ProviderSelectorPageState extends State<ProviderSelectorPage> {
  final pokemon = Pokemon(
    name: 'Snorlax',
    level: 30,
    ability: 'Immunity',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Selector Page'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => PokemonProvider(pokemon),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  _PokemonInfo(),
                  _PokemonAbility(),
                ],
              )),
              _LevelUpButton(),
              _ChangeAbilityButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PokemonInfo extends StatelessWidget {
  const _PokemonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Selector<PokemonProvider, String>(
                selector: (context, pokemonProvider) =>
                    pokemonProvider.pokemon.name,
                builder: (context, name, _) {
                  debugPrint('_PokemonInfo widget selector on name');
                  return Text('$name', style: TextStyle(fontSize: 24));
                }),
            Selector<PokemonProvider, int>(
                selector: (context, pokemonProvider) =>
                    pokemonProvider.pokemon.level,
                builder: (context, level, _) {
                  debugPrint('_PokemonInfo widget selector on level');
                  return Text('Lvl. $level',
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey));
                }),
          ],
        ),
      ),
      color: Colors.white,
      elevation: 4,
    );
  }
}

class _PokemonAbility extends StatelessWidget {
  const _PokemonAbility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<PokemonProvider, String>(
        selector: (context, pokemonProvider) => pokemonProvider.pokemon.ability,
        builder: (context, ability, _) {
          debugPrint('_PokemonAbility widget selector on ability');
          return Card(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Text('Ability: $ability', style: TextStyle(fontSize: 24)),
            ),
            color: Colors.white,
            elevation: 4,
          );
        });
  }
}

class _LevelUpButton extends StatelessWidget {
  const _LevelUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          pokemonProvider.levelUp();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            'Level up',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class _ChangeAbilityButton extends StatelessWidget {
  const _ChangeAbilityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          pokemonProvider.changeAbility(
              pokemonProvider.pokemon.ability == 'Immunity'
                  ? 'Thick Fat'
                  : 'Immunity');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            'Change Ability',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
