import 'package:drinkalot/const/colors.dart';
import 'package:drinkalot/const/consts.dart';
import 'package:drinkalot/mockup.dart';
import 'package:drinkalot/models/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../functions.dart';
import '../widgets/card_swipe/swipe_cards.dart';
import '../widgets/drinkalot/button.dart';

class SwipeCardsScreen extends StatefulWidget {
  const SwipeCardsScreen({super.key});

  @override
  State<SwipeCardsScreen> createState() => _SwipeCardsScreenState();
}

class _SwipeCardsScreenState extends State<SwipeCardsScreen> {
  // final List<SwipeItem<CardModel>> _swipeItems = [];
  late MatchEngine _matchEngine;

  @override
  void initState() {
    final cards = context.read<List<CardModel>>();
    // addRandomCardOnSwipe(cards);
    // addRandomCardOnSwipe(cards);

    _matchEngine = MatchEngine(
        swipeItems:
            cards.map((card) => SwipeItem<CardModel>(content: card)).toList());
    super.initState();
  }

  // void addRandomCardOnSwipe(List<CardModel> cards) {
  //   final random = Random();
  //   var index = random.nextInt(cards.length);
  //   _swipeItems.add(SwipeItem(
  //       content: cards[index],
  //       beforeSideAction: () {
  //         addRandomCardOnSwipe(cards);
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    final cards = context.watch<List<CardModel>>();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Drinkalot',
            style: TextStyle(color: red, fontFamily: font, fontSize: 40),
          ),
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
                    final item = cards[index];
                    final deck =
                        decks.firstWhere((element) => element.id == item.deck);
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: darkenColor(deck.color, .3), width: 5),
                          color: deck.color,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          if (deck.backgroundImage != null)
                            SvgPicture.asset(
                              deck.backgroundImage!,
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(.15),
                                  BlendMode.srcIn),
                            ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                item.description.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontFamily: font,
                                    height: 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  onStackFinished: () {},
                  upSwipeAllowed: true,
                  downSwipeAllowed: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1 / 2),
              child: Row(
                children: [
                  // button('<-', () {
                  //   _matchEngine.currentItem?.right();
                  // }, 100, 60.0),
                  Expanded(
                    child: button('PRÓXIMA', () {
                      _matchEngine.currentItem?.right();
                    }, MediaQuery.of(context).size.width * .5, 60.0),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
