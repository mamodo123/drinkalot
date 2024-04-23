import 'package:drinkalot/sqlite.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

import 'models/card.dart';
import 'models/deck.dart';

Future<List<Deck>> getDecks() async {
  final shouldfilterCreatedByUserMap =
      await rawQuery('card', 'select count(*) total from card where deck = -1');
  String? filterCreatedByUser =
      shouldfilterCreatedByUserMap.first['total'] == 0 ? 'id != -1' : null;
  final deckMaps = await getData('deck', where: filterCreatedByUser);
  final decks = deckMaps.map((e) => Deck.fromJson(e)).toList();

  final purchasedIds = await loadPurchasedProducts(decks);
  for (final deck in decks) {
    if (purchasedIds.contains(deck.playstoreId)) {
      deck.hasBought = true;
    }
  }
  return decks;
}

Future<List<CardModel>> getCards(List<int> deckIds) async {
  if (deckIds.contains(-1)) {
    deckIds.add(-1);
  }
  final cardListMaps = await getData('card',
      where: 'deck in (${List.filled(deckIds.length, '?').join(',')})',
      whereArgs: deckIds);
  final cardList = cardListMaps.map((e) => CardModel.fromJson(e)).toList();
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
  await update('deck', {'hasBought': true},
      where: 'playstoreId = ?', whereArgs: [code]);
}

Future<List<CardModel>> getCardsCreatedByUser() async {
  return await getCards([-1]);
}

Future<void> createOrUpdateCardCreatedByUser(CardModel card) async {
  final cardJson = card.toJson();
  if (card.id == null) {
    cardJson.remove('id');
  }
  insertOrUpdate('card', [cardJson]);
}

Future<void> deleteCardCreatedByUser(CardModel card) async {
  await delete('card', where: 'id = ?', whereArgs: [card.id]);
}
