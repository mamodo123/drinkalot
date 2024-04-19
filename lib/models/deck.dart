import 'package:flutter/cupertino.dart';

class Deck {
  final int id;
  final String title;
  final String? backgroundImage;
  final bool createdByUser, hasBought;

  const Deck(
      {required this.id,
      required this.title,
      required this.backgroundImage,
      required this.createdByUser,
      required this.hasBought});

  Deck.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backgroundImage = json['backgroundImage'],
        createdByUser = json['createdByUser'],
        hasBought = json['hasBought'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'backgroundImage': backgroundImage,
        'createdByUser': createdByUser,
        'hasBought': hasBought,
      };
}

class DeckListNotifier with ChangeNotifier {
  List<Deck> _decks;

  List<Deck> get decks => _decks;

  set decks(List<Deck> value) {
    _decks = value;
    notifyListeners();
  }

  DeckListNotifier({required List<Deck> decks}) : _decks = decks;
}
