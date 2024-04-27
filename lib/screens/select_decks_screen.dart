import 'dart:math';

import 'package:drinkalot/models/card.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:drinkalot/screens/swipe_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manage_data.dart';

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
                        final deckIds = selectedDecks.map((e) => e.id).toList();
                        final preCardList = await getCards(deckIds);
                        final List<CardModel> cardList = [];
                        for (final deck in selectedDecks) {
                          if (deck.hasBought) {
                            cardList.addAll(preCardList
                                .where((element) => element.deck == deck.id));
                          } else {
                            final random5 = getRandomElements(
                                preCardList
                                    .where((element) => element.deck == deck.id)
                                    .toList(),
                                5);
                            cardList.addAll(random5);
                          }
                        }
                        cardList.shuffle();
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
                    case 'green':
                      bg = Colors.green;
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
                        child: Container(
                          color: bg,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  deck.title,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (!deck.hasBought)
                                const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text('Trial')),
                              if (decksState[deck] ?? false)
                                Container(
                                  color: Colors.black.withOpacity(0.4),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        if (!deck.hasBought)
                                          const Text(
                                            '5 cartas aleatórias',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ),
        if (_loading)
          Container(
            color: Colors.black.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}

List<T> getRandomElements<T>(List<T> list, int n) {
  final List<T> listCopy = List.from(list);
  final random = Random();
  final List<T> selectedElements = [];
  for (var i = 0; i < n; i++) {
    final randomIndex = random.nextInt(listCopy.length);
    selectedElements.add(listCopy[randomIndex]);
    listCopy.removeAt(randomIndex);
  }

  return selectedElements;
}
