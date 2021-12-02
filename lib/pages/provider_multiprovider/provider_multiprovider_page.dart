import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronflex_flutter/models/pokemon.dart';
import 'package:ronflex_flutter/models/trainer.dart';

class ProviderMultiProviderPage extends StatelessWidget {
  const ProviderMultiProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Pokemon(name: 'Bulbasaur', level: 5, ability: 'Overgrow');
    final trainer = Trainer(name: 'Red', age: 14);

    return Scaffold(
        appBar: AppBar(
          title: Text('Provider MultiProvider Page'),
          centerTitle: true,
        ),
        body: MultiProvider(
            providers: [
              Provider(create: (_) => trainer),
              Provider(create: (_) => pokemon),
            ],
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  _PokemonInfo(),
                  _TrainerInfo(),
                ],
              ),
            )));
  }
}

class _PokemonInfo extends StatelessWidget {
  const _PokemonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${pokemon.name}', style: TextStyle(fontSize: 24)),
            Text('Lvl. ${pokemon.level}',
                style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
          ],
        ),
      ),
      color: Colors.white,
      elevation: 4,
    );
  }
}

class _TrainerInfo extends StatelessWidget {
  const _TrainerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trainer = Provider.of<Trainer>(context);

    debugPrint('_PokemonMainInfo widget consumer');
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${trainer.name}', style: TextStyle(fontSize: 24)),
            Text('${trainer.age} years old',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
          ],
        ),
      ),
      color: Colors.white,
      elevation: 4,
    );
  }
}
