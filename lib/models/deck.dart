import 'package:drinkalot/manage_data.dart';
import 'package:flutter/cupertino.dart';

class Deck {
  final int id;
  final String title;
  final String? backgroundImage, squaredBackgroundImage;
  final bool createdByUser;
  final String? playstoreId;
  final Color color;
  bool hasBought;

  Deck(
      {required this.id,
      required this.title,
      required this.backgroundImage,
      required this.squaredBackgroundImage,
      required this.createdByUser,
      required this.hasBought,
      required this.playstoreId,
      required this.color});

  Deck.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backgroundImage = json['backgroundImage'],
        squaredBackgroundImage = json['squaredBackgroundImage'],
        createdByUser = json['createdByUser'] == 1,
        hasBought = json['hasBought'] == 1,
        playstoreId = json['playstoreId'],
        color = Color(json['color'] as int);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'backgroundImage': backgroundImage,
        'squaredBackgroundImage': squaredBackgroundImage,
        'createdByUser': createdByUser,
        'hasBought': hasBought,
        'playstoreId': playstoreId,
        'color': color.value,
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
