import 'package:drinkalot/manage_data.dart';
import 'package:flutter/cupertino.dart';

class Deck {
  final int id;
  final String title;
  final String? backgroundImage;
  final bool createdByUser;
  final String? playstoreId;
  bool hasBought;

  Deck(
      {required this.id,
      required this.title,
      required this.backgroundImage,
      required this.createdByUser,
      required this.hasBought,
      required this.playstoreId});

  Deck.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backgroundImage = json['backgroundImage'],
        createdByUser = json['createdByUser'],
        hasBought = json['hasBought'],
        playstoreId = json['playstoreId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'backgroundImage': backgroundImage,
        'createdByUser': createdByUser,
        'hasBought': hasBought,
        'playstoreId': playstoreId,
      };
}

class DeckListNotifier with ChangeNotifier {
  List<Deck> _decks;

  List<Deck> get decks => _decks;

  set decks(List<Deck> value) {
    _decks = value;
    notifyListeners();
  }

  Future<void> reloadDecks() async {
    _decks = await getDecks();
    notifyListeners();
  }

  DeckListNotifier({required List<Deck> decks}) : _decks = decks;
}
