import 'package:carousel_slider/carousel_slider.dart';
import 'package:drinkalot/models/card.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:drinkalot/screens/create_card_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manage_data.dart';
import '../models/pair.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({super.key});

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  late final Future<List<CardModel>> cardsFuture;
  late List<CardModel> cards;
  final CarouselController carouselController = CarouselController();

  Future<List<CardModel>> getCardsFuture() async {
    cards = await getCardsCreatedByUser();
    return cards;
  }

  @override
  void initState() {
    cardsFuture = getCardsFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardModel>>(
        future: cardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Drinkalot'),
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 500,
                          ),
                          items: cards.map<Widget>((card) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.625, horizontal: 10),
                                  child: AspectRatio(
                                    aspectRatio: 0.64,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Text(
                                                card.description,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                  onPressed: () async {
                                                    await createCard(
                                                        context, card);
                                                    if (context.mounted) {
                                                      final cardListNotifier =
                                                          context.read<
                                                              DeckListNotifier>();
                                                      await cardListNotifier
                                                          .reloadDecks();
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList()
                            ..add(Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.625, horizontal: 10),
                              child: AspectRatio(
                                aspectRatio: 0.64,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async =>
                                          createCard(context, null),
                                    ),
                                  ),
                                ),
                              ),
                            ))),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await carouselController
                                .animateToPage(cards.length);
                            if (context.mounted) {
                              await createCard(context, null);
                            }
                          },
                          child: const Text('Criar')),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${cards.length} cartas criadas')
                    ],
                  ));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<void> createCard(BuildContext context, CardModel? cardToEdit) async {
    final cardPair = await showDialog<Pair<CardModel, bool>>(
        context: context,
        builder: (context) => CreateCardDialog(
              card: cardToEdit,
            ));
    if (cardPair != null) {
      if (cardPair.second) {
        await deleteCardCreatedByUser(cardPair.first);
      } else {
        if (context.mounted) {
          await createOrUpdateCardCreatedByUser(cardPair.first);
        }
      }
      final newCards = await getCardsFuture();
      setState(() {
        cards = newCards;
      });
      if (context.mounted) {
        final cardListNotifier = context.read<DeckListNotifier>();
        await cardListNotifier.reloadDecks();
      }
    }
  }
}
