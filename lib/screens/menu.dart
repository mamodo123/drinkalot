import 'package:drinking_game/screens/decks_screen.dart';
import 'package:drinking_game/screens/select_decks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/deck.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.watch<DeckListNotifier>();
    final decks = decksNotifier.decks;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider<
                                      DeckListNotifier>.value(
                                    value: decksNotifier,
                                  )
                                ],
                                child: const SelectDecksScreen(),
                              )));
                },
                child: const Text('Jogar')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider<
                                      DeckListNotifier>.value(
                                    value: decksNotifier,
                                  )
                                ],
                                child: const DecksScreen(),
                              )));
                },
                child: const Text('Comprar baralhos')),
          ],
        ),
      ),
    );
  }
}
