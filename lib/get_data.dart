import 'package:drinkalot/mockup.dart';
import 'models/card.dart';
import 'models/deck.dart';

Future<List<Deck>> getDecks() async {
  return decks;
}

Future<List<CardModel>> getCards(Iterable<int> deckIds) async {
  final cardList =
      cards.where((element) => deckIds.contains(element.deck)).toList();
  return cardList;
}
