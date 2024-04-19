import 'models/card.dart';
import 'models/deck.dart';

const List<Deck> decks = [
  Deck(
      id: 0,
      title: 'Clássicas',
      backgroundImage: 'red',
      createdByUser: false,
      hasBought: false),
  Deck(
      id: 1,
      title: 'Eu Nunca Picante',
      backgroundImage: 'pink',
      createdByUser: false,
      hasBought: true),
  Deck(
      id: 2,
      title: 'Para deixar muito bebado',
      backgroundImage: 'blue',
      createdByUser: false,
      hasBought: true),
  Deck(
      id: 3,
      title: 'Sexual',
      backgroundImage: 'yellow',
      createdByUser: false,
      hasBought: true),
  Deck(
      id: 4,
      title: 'Desafios de festa',
      backgroundImage: 'purple',
      createdByUser: false,
      hasBought: true),
];

final List<CardModel> cards = [
  const CardModel(
      id: 0,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos os homens bebem'),
  const CardModel(
      id: 1,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos as mulheres bebem'),
  const CardModel(
      id: 2,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca transei na universidade'),
  const CardModel(
      id: 3,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca transei em local público'),
  const CardModel(
      id: 4,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça um copo para a pessoa mais nova. Se ela não terminar tudo até a sua próxima rodada, ela deve deixar o celular dela desbloqueado com você por 3 minutos'),
  const CardModel(
      id: 5,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'O último a virar o copo deve ficar até a sua próxima rodada de cabeça para baixo'),
  const CardModel(
      id: 6,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Deixe o jogador a sua esquerda tirar uma peça de roupa sua'),
  const CardModel(
      id: 7,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Feche os olhos e alguem lhe dá um beijo em alguma parte do corpo. Se não adivinhar quem é, beba 2 vezes'),
  const CardModel(
      id: 8,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Dance totalmente fora do ritmo no meio da pista'),
  const CardModel(
      id: 9,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Quem beijar a pessoa mais alta ganha'),
];
