import 'package:drinkalot/screens/decks_screen.dart';
import 'package:drinkalot/screens/select_decks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/deck.dart';
import '../widgets/direction_drag.dart';
import 'code_dialog.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final code = [
    DIRECTION.left,
    DIRECTION.right,
    DIRECTION.bottom,
    DIRECTION.top
  ];

  List<DIRECTION> currentCode = [];

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.watch<DeckListNotifier>();
    final minSize = MediaQuery.of(context).size.width * 0.4;
    return DirectionDrag(
      onDirection: (direction) {
        currentCode.add(direction);
        if (isEqualList(code, currentCode)) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return ChangeNotifierProvider<DeckListNotifier>.value(
                  value: decksNotifier,
                  child: const CodeDialog(),
                );
              });
          currentCode = [];
        } else if (isEqualList(
            code.sublist(0, currentCode.length), currentCode)) {
          print('X');
        } else if (direction == code[0]) {
          currentCode = [direction];
        } else {
          currentCode = [];
        }
      },
      minAngleThreshold: 0.58,
      minDistanceHorizontal: minSize,
      minDistanceVertical: minSize,
      child: Scaffold(
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
      ),
    );
  }
}

bool isEqualList<T>(List<T> list1, List<T> list2) {
  if (list1.length != list2.length) {
    return false;
  }
  for (var i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }
  return true;
}
