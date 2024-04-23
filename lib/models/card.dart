class CardModel {
  final int? id;
  final int deck;
  final String? title, help, imagePath;
  final String description;

  const CardModel(
      {required this.id,
      required this.deck,
      required this.title,
      required this.help,
      required this.imagePath,
      required this.description});

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        deck = json['deck'],
        title = json['title'],
        help = json['help'],
        imagePath = json['imagePath'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'deck': deck,
        'title': title,
        'help': help,
        'imagePath': imagePath,
        'description': description,
      };
}
