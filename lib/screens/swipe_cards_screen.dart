import 'dart:math';

import 'package:drinkalot/models/card.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/card_swipe/swipe_cards.dart';

class SwipeCardsScreen extends StatefulWidget {
  const SwipeCardsScreen({super.key});

  @override
  State<SwipeCardsScreen> createState() => _SwipeCardsScreenState();
}

class _SwipeCardsScreenState extends State<SwipeCardsScreen> {
  final List<SwipeItem<CardModel>> _swipeItems = [];
  late MatchEngine _matchEngine;

  @override
  void initState() {
    final cards = context.read<List<CardModel>>();
    addRandomCardOnSwipe(cards);
    addRandomCardOnSwipe(cards);

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  void addRandomCardOnSwipe(List<CardModel> cards) {
    final random = Random();
    var index = random.nextInt(cards.length);
    _swipeItems.add(SwipeItem(
        content: cards[index],
        beforeSideAction: () {
          addRandomCardOnSwipe(cards);
        }));
  }

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.read<DeckListNotifier>();
    final decks = decksNotifier.decks;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drinkalot'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AspectRatio(
                aspectRatio: 0.64,
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _swipeItems[index].content;
                    final deck =
                        decks.firstWhere((element) => element.id == item.deck);
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
                    return Container(
                      decoration: BoxDecoration(
                          color: bg, borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        item.description,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                  onStackFinished: () {},
                  upSwipeAllowed: true,
                  downSwipeAllowed: true,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _matchEngine.currentItem?.right();
                },
                child: const Text("Próxima"))
          ]),
        ));
  }
}
