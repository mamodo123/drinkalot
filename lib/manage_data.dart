import 'package:drinkalot/mockup.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'models/card.dart';
import 'models/deck.dart';

Future<List<Deck>> getDecks() async {
  final purchasedIds = await loadPurchasedProducts(decks);
  for (final deck in decks) {
    if (purchasedIds.contains(deck.playstoreId)) {
      deck.hasBought = true;
    }
  }
  return decks;
}

Future<List<CardModel>> getCards(Iterable<int> deckIds) async {
  final cardList =
      cards.where((element) => deckIds.contains(element.deck)).toList();
  return cardList;
}

Future<List<String>> loadPurchasedProducts(List<Deck> decks) async {
  final List<String> ids = [];
  await FlutterInappPurchase.instance.initialize();
  final decksIds = decks
      .map((e) => e.playstoreId)
      .where((element) => element != null)
      .map((e) => e!);
  final list = await FlutterInappPurchase.instance.getPurchaseHistory();
  if (list != null) {
    for (final product in list) {
      if (product.productId != null && decksIds.contains(product.productId)) {
        ids.add(product.productId!);
      }
    }
  }
  return ids;
}

Future<void> buyDeck(String code) async {
  decks.firstWhere((element) => element.playstoreId == code).hasBought = true;
  print(decks.firstWhere((element) => element.playstoreId == code).hasBought);
}
