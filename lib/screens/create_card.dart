import 'package:carousel_slider/carousel_slider.dart';
import 'package:drinkalot/const/consts.dart';
import 'package:drinkalot/models/card.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:drinkalot/screens/create_card_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../const/utils.dart';
import '../functions.dart';
import '../manage_data.dart';
import '../models/pair.dart';
import '../widgets/drinkalot/button.dart';

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
                    title: Text(
                      'Drinkalot',
                      style:
                        appNameTextStyle(red, 40),
                    ),
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
                                    child: GestureDetector(
                                      onDoubleTap: () async =>
                                          await editCard(context, card),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: darkenColor(red, .3),
                                                  width: 5),
                                              color: red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(10),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Text(
                                                  card.description.toUpperCase(),
                                                  style: cardTextStyle(Colors.white, 50, height: 0.8),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                    onPressed: () async =>
                                                        await editCard(
                                                            context, card),
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
                                child: GestureDetector(
                                  onTap: () => createCard(context, null),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: darkenColor(red, .3),
                                              width: 5),
                                          color: red,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))),
                      const SizedBox(
                        height: 10,
                      ),
                      button(
                        'CRIAR',
                        () async {
                          await carouselController.animateToPage(cards.length);
                          if (context.mounted) {
                            await createCard(context, null);
                          }
                        },
                        MediaQuery.of(context).size.width * 0.7,
                        60,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${cards.length} ${cards.length == 1 ? 'carta criada' : 'cartas criadas'}',
                        style: const TextStyle(
                            color: darkRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
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

  Future<void> editCard(BuildContext context, CardModel card) async {
    await createCard(context, card);
    if (context.mounted) {
      final cardListNotifier = context.read<DeckListNotifier>();
      await cardListNotifier.reloadDecks();
    }
  }
}
