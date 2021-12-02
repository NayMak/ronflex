import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ronflex_flutter/models/pokemon.dart';
import 'package:ronflex_flutter/providers/pokemon_provider.dart';

class ProviderConsumerPage extends StatefulWidget {
  const ProviderConsumerPage({Key? key}) : super(key: key);

  @override
  _ProviderConsumerPageState createState() => _ProviderConsumerPageState();
}

class _ProviderConsumerPageState extends State<ProviderConsumerPage> {
  final pokemon = Pokemon(
    name: 'Mewtwo',
    level: 70,
    ability: 'Pressure',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Consumer Page'),
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
    return Consumer<PokemonProvider>(builder: (context, pokemonProvider, _) {
      debugPrint('_PokemonInfo widget consumer');
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${pokemonProvider.pokemon.name}',
                  style: TextStyle(fontSize: 24)),
              Text('Lvl. ${pokemonProvider.pokemon.level}',
                  style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
            ],
          ),
        ),
        color: Colors.white,
        elevation: 4,
      );
    });
  }
}

class _PokemonAbility extends StatelessWidget {
  const _PokemonAbility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(builder: (context, pokemonProvider, _) {
      debugPrint('_PokemonAbility widget consumer');
      return Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Text('Ability: ${pokemonProvider.pokemon.ability}',
              style: TextStyle(fontSize: 24)),
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
              pokemonProvider.pokemon.ability == 'Pressure'
                  ? 'Unnerve'
                  : 'Pressure');
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
