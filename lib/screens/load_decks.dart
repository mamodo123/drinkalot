import 'package:drinkalot/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../get_data.dart';
import 'menu.dart';

class LoadDecksScreen extends StatefulWidget {
  const LoadDecksScreen({super.key});

  @override
  State<LoadDecksScreen> createState() => _LoadDecksScreenState();
}

class _LoadDecksScreenState extends State<LoadDecksScreen> {
  Future<void> loadDeckList(BuildContext context) async {
    final decks = await getDecks();
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider<DeckListNotifier>(create: (_) => DeckListNotifier(decks: decks)),
                  ],
                  child: const MenuScreen(),
                )),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadDeckList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
