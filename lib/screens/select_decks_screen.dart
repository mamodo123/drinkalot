import 'package:drinkalot/models/card.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:drinkalot/screens/swipe_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../get_data.dart';

class SelectDecksScreen extends StatefulWidget {
  const SelectDecksScreen({super.key});

  @override
  State<SelectDecksScreen> createState() => _SelectDecksScreenState();
}

class _SelectDecksScreenState extends State<SelectDecksScreen> {
  late final Map<Deck, bool> decksState;

  List<Deck> get selectedDecks => decksState.entries
      .where((element) => element.value)
      .map((e) => e.key)
      .toList();

  var _loading = false;

  @override
  void initState() {
    final decksNotifier = context.read<DeckListNotifier>();
    final decks = decksNotifier.decks;
    decksState =
        Map.fromIterables(decks, List.generate(decks.length, (_) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.read<DeckListNotifier>();
    final decks = decksNotifier.decks;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              for (final element in decks) {
                decksState[element] = false;
              }
            });
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Drinkalot'),
              actions: [
                if (selectedDecks.isNotEmpty)
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          _loading = true;
                        });
                        final deckIds = selectedDecks.map((e) => e.id);
                        final cardList = await getCards(deckIds);
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MultiProvider(
                                      providers: [
                                        ChangeNotifierProvider<
                                            DeckListNotifier>.value(
                                          value: decksNotifier,
                                        ),
                                        Provider<List<CardModel>>.value(
                                            value: cardList),
                                      ],
                                      child: const SwipeCardsScreen(),
                                    )),
                          );
                        }
                        setState(() {
                          _loading = false;
                        });
                      },
                      child: const Text('Jogar'))
              ],
            ),
            body: GridView.count(
                crossAxisCount: 3,
                children: decks.map((deck) {
                  late final Color bg;
                  switch (deck.backgroundImage) {
                    case 'red':
                      bg = Colors.red;
                      break;
                    case 'pink':
                      bg = Colors.pink;
                      break;
                    case 'blue':
                      bg = Colors.blue;
                      break;
                    case 'yellow':
                      bg = Colors.yellow;
                      break;
                    case 'purple':
                      bg = Colors.purple;
                      break;
                  }
                  return AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          final value = decksState[deck];
                          if (value != null) {
                            setState(() {
                              decksState[deck] = !value;
                            });
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              color: bg,
                            ),
                            if (decksState[deck] ?? false)
                              Container(
                                color: Colors.black.withOpacity(0.8),
                                child: const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ),
        if (_loading)
          Container(
            color: Colors.black.withOpacity(0.8),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
