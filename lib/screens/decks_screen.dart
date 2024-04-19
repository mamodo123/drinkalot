import 'package:carousel_slider/carousel_slider.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecksScreen extends StatefulWidget {
  const DecksScreen({super.key});

  @override
  State<DecksScreen> createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.watch<DeckListNotifier>();
    final decks = decksNotifier.decks;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drinkalot'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: decks.map((deck) {
                  return Builder(
                    builder: (BuildContext context) {
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
                        aspectRatio: 0.64,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: bg,
                                    borderRadius: BorderRadius.circular(20)),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  deck.title,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              if (deck.hasBought)
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      'Já adquirido',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: decks[_currentIndex].hasBought ? null : () {},
                child: const Text('Comprar'))
          ],
        ));
  }
}
