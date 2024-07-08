import 'package:drinkalot/screens/create_card.dart';
import 'package:drinkalot/screens/decks_screen.dart';
import 'package:drinkalot/screens/select_decks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../const/images.dart';
import '../models/deck.dart';
import '../widgets/direction_drag.dart';
import '../widgets/drinkalot/button.dart';
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

  late GlobalKey<ShakeWidgetState> shakeKey;

  @override
  void initState() {
    shakeKey = GlobalKey<ShakeWidgetState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .6;
    const height = 60.0;
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
              GestureDetector(
                onTap: () {
                  shakeKey.currentState?.shake();
                },
                child: ShakeMe(
                  key: shakeKey,
                  // 5. configure the animation parameters
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: const Duration(milliseconds: 500),
                  child: SvgPicture.asset(
                    logo,
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              button(
                'JOGAR',
                () {
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
                width,
                height,
              ),
              button(
                'COMPRAR BARALHOS',
                () {
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
                width,
                height,
              ),
              button(
                'MINHAS CARTAS',
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<DeckListNotifier>.value(
                                value: decksNotifier,
                                child: const CreateCardScreen(),
                              )));
                },
                width,
                height,
              ),
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
