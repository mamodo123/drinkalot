import 'models/card.dart';
import 'models/deck.dart';

final List<Deck> decks = [
  Deck(
      id: 0,
      title: 'Clássicas',
      backgroundImage: 'red',
      createdByUser: false,
      hasBought: true,
      playstoreId: null),
  Deck(
      id: 1,
      title: 'Eu Nunca Picante',
      backgroundImage: 'pink',
      createdByUser: false,
      hasBought: false,
      playstoreId: 'have_i_never_spice'),
  Deck(
      id: 2,
      title: 'Para deixar muito bebado',
      backgroundImage: 'blue',
      createdByUser: false,
      hasBought: false,
      playstoreId: 'to_get_very_drunk'),
  Deck(
      id: 3,
      title: 'Sexual',
      backgroundImage: 'yellow',
      createdByUser: false,
      hasBought: false,
      playstoreId: 'sexual'),
  Deck(
      id: 4,
      title: 'Desafios de festa',
      backgroundImage: 'purple',
      createdByUser: false,
      hasBought: false,
      playstoreId: 'party_challenges'),
  Deck(
      id: -1,
      title: 'Minhas cartas',
      backgroundImage: 'green',
      createdByUser: true,
      hasBought: true,
      playstoreId: null)
];

final List<CardModel> cards = [
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca transei na universidade'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos os homens bebem'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos as mulheres bebem'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos bebem'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça um copo para a pessoa mais nova. Se ela não terminar tudo até a sua próxima rodada, ela deve deixar o celular dela desbloqueado com você por 3 minutos'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca transei em local público'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiquei com um parente meu'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz menáge'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz sexo anal'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'O último a virar o copo deve ficar até a sua próxima rodada de cabeça para baixo'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Escolha uma pessoa para beber'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Escolha duas pessoas para beberem ou uma para beber 2 vezes'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Verdade ou Consequência (a mesa faz para você)'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Jogo da memória'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Jogo do PI'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Deixe o jogador a sua esquerda tirar uma peça de roupa sua'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Feche os olhos e alguem lhe dá um beijo em alguma parte do corpo. Se não adivinhar quem é, beba 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Demonstre em algum objeto como se faz um sexo oral. Se não for sexy, bebe 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Mande um semi-nude e mande para alguém da roda. Se não fizer, beba 5 vezes'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Peça para a mesa separar um shot de cada bebida, beba de olhos vendados e descubra qual é qual. Cada uma que errar, você bebe um shot de novo dela'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Misture todos os copos em um, passe a bebida entre a roda até o drink terminar'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Finja que sua boca é um copo: a pessoa a sua direita faz um drink diretamente dentro dela'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Próxima vez que alguém beber, beba junto'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Tome 1 gole para cada ex-namorado(a) que você já teve'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Simule uma posição sexual com uma pessoa da roda. Se não for convincente, beba 3 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos tiram uma peça de roupa'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description: 'Troque de roupa com a pessoa a sua frente'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Não diga nada, bote uma mão na testa e conte até 10. Quem não fizer o mesmo bebe (se todos fizer, o último bebe)'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Invente um apelido para si mesmo, quem esquecer, bebe'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca beijei alguém da roda'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca me masturbei pensando em alguém da roda'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca talariquei alguém da roda'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca assisti hentai'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Levante e dance até sua próxima vez de jogar'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Tudo que vai, volta! Você pode redirecionar o alvo de alguma carta para outra pessoa'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Gêmeos! Você pode copiar uma carta para outra pessoa '),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Sorte no amor, azar no jogo. Até sua próxima rodada, toda vez que um jogador pegar uma carta, jogue uma moeda. Se for cara, você e aquele jogador realizam a ação'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Pessoa com o maior nome (em letras) bebe'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Crie uma regra. Até sua próxima rodada, quem descumpri-la bebe'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça um copo para você. A pessoa mais velha faz também, mas com o dobro de alchool'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Não diga nada e comece a cantar Evidências. Quem não cantar junto, bebe 3 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'De um selinho em alguém da roda. Beba 1 gole para cada segundo de duração'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description: 'Faça o gemidão do Zap. Se não conseguir, beba 4 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça um lap dance para o jogador a sua direita ou beba 5 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Deixe um jogador dar um chupão em alguma parte do seu corpo ou beba 5 vezes'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz beijo grego'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca me masturbei utilizando algum objeto'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz BDSM'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca me filmei transando'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz sexting'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca me masturbei na casa de alguém da roda'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca me masturbei em um banheiro público'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca quis beijar alguém da roda'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz sexo oral no cinema'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz realizei um fetiche estranho'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description: '7 minutos no paraíso com alguém da roda'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Deixa alguem apertar alguma parte íntima sua ou beba 4 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Chupe o seu dedo e dê para alguém chupar depois. Se a pessoa recusar, ela bebe 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Demonstre como seria uma pegada forte no jogador a sua esquerda. Se não for convincente, beba 3 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description: 'Faça uma massagem sensual no jogador a sua frente'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Leia um conto pornô de forma sexy para a roda. Se não for sexy, beba 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Conte a sua melhor experiência sexual para a roda. Se alguem contar uma melhor, você bebe 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Mostre como colocar uma camisinha em algum objeto. Se não masturbar ele, beba 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Responda uma pergunta sexual de cada jogador da roda. Beba 1 gole para cada uma que quiser fugir'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Cada jogador bebe 1 gole do jogador a sua direita'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fui a um clube para adultos'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiquei com alguém do mesmo gênero que eu'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca transei no banheiro de uma festa'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiquei com alguém 10 anos mais velho que eu'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca postei uma foto sensual em redes sociais'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz sexo com mais pessoas no mesmo ambiente'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fui pego fazendo sexo'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca usei algemas durante o sexo'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz sexo com alguém comprometido'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca fiz atividades sexuais sem beijar a pessoa antes'),
  const CardModel(
      id: null,
      deck: 1,
      title: null,
      help: null,
      imagePath: null,
      description: 'Eu nunca dei ou recebi tapas durante o sexo'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Stop - Escolha um tema e diga uma palavra, quem não conseguir, bebe'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'A mesa faz um copo para você. Enquanto você não parar de beber, ninguém para. Se alguém parar, você faz o copo daquela pessoa'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Fique de mãos dadas com o jogador a sua direita. Vocês jogam juntos até a sua próxima rodada'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'A mesa escolhe uma música para você cantar. Se não conseguir, bebe'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos os solteiros bebem'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos os comprometidos bebem'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Buffalo Bill'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Escolha uma palavra. Cada um grita a palavra mais alto que o anterior. Quem desistir, bebe. Se ninguém desistir, todos bebem'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Jogo do cú. Cada jogador vai trocando uma palavra de um filme por cú. Quem não conseguir, bebe'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'O jogador da sua direita escolhe uma mímica para você fazer. Você tem um minuto para fazer ela, senão bebe'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Escolha uma cor e conte até 10. Ao final, todos os jogadores tem de estar tocando em algo desta cor, senão bebe. Ninguém pode repetir os objetos'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Mande uma pergunta sexual para alguém no seu celular e diga a resposta para a roda'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Sussure no ouvido de alguma pessoa algo sexual que você gostaria de fazer com ela. Se não tiver nada, beba 3 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Arrepie alguma pessoa, com palavras no ouvido e com ações. Se não conseguir, bebe'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Imite alguma posição do Kamasutra com o jogador a sua esquerda. Se não conseguirem, ambos bebem'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça uma dança sensual em outro jogador. Se não conseguir, beba 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Mostre algum sexting que você já teve. Se não tiver nenhum, beba 4 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Vire de costas e receba um tapa na bunda do jogador a sua frente'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Passa-carta. Os jogadores passam uma carta com a boca, segurada apenas pelo vácuo. Quem deixar cair bebe 2 vezes'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Vale-beijo. Você pode beijar alguém caso vire o seu copo cheio. Esta carta pode ser vendida'),
  const CardModel(
      id: null,
      deck: 3,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Para cada peça de roupa que você tirar, um jogador beberá 2 vezes'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'A mesa faz um shot com 3 ingredientes qualquer. Adivinhe o que tem dentro ou beba mais 2 shots da mesma bebida'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Formem duas equipes. Preparem um copo com até 3 ingredientes para a outra equipe. A equipe que não terminar o seu copo, beberá 3x mais até a próxima rodada de cada jogador'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description: 'Todos bebem 2 vezes e giram 5 vezes'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Formem duas equipes e façam uma batalha de rap. Quem perder, bebe 2 vezes'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Mostre a sua galeria para a mesa. Toda vez que alguem quiser clicar em uma foto, ela bebe. Você pode negar bebendo tambem'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description: 'Beba do seu copo como se fosse um gato por 10 segundos'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description: 'Beba de cabeça para baixo'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Finja ser alguém conhecido. A mesa faz perguntas de sim ou não. Chutou e errou, bebe. Se acertar, todos bebem, menos quem acertou'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Escolha um objeto a sua vista. A mesa faz perguntas de sim ou não. A cada pergunta, aquela pessoa bebe, até acertarem'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'A pessoa mais velha faz um drink para a mesa. Ela bebe 2 vezes e o resto bebe 1'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Escoha uma palavra. Cada pessoa canta um trecho de uma música que tenha aquela palavra. Você bebe junto com cada pessoa que não conseguir'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Dance totalmente fora do ritmo no meio da pista'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Quem beijar a pessoa mais alta ganha'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Quem beijar a pessoa mais baixa ganha'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Jogue "Bateu Virou" com uma pessoa aleatória na pista'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Dance com alguém aleatório na pista'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça uma cantada para alguém. Se você beijar a pessoa, todos menos você bebem'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Inicie uma conversa com alguém fingindo ser outra pessoa que está jogando'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Imite um animal! Fique em 4 patas e comece a andar assim no meio da festa'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Wingman! Faça uma cantada para alguém para o seu amigo'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Todo mundo mistura os copos, independente do que estejam bebendo'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Pra que inimigos se você amigos? O último jogador que jogou faz um copo de bebida para você'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'pinto! PINTO! Um por vez, grite pinto cada vez mais alto com seus amigos. Quem desistir, perde'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Uive! Apenas uive! Bem alto'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Ih, que isso? É uma bicicleta humana'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Convide alguém aleatório na pista para puxar uma carta'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Inicie um grito que todos da festa reconhecem e faça-os gritar com você'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Tire a camiseta e comece a girar descontroladamente'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Peça para beijar alguma pessoa que está servindo no bar'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Dê estrelinhas até chegar no bar'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Comece a falar outra língua com alguém aleatório na pista'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Beije alguém jogando Pedra, Papel ou Tesoura'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Chegue em alguém aleatório na pista e fale "Por que João, por que você fez isso comigo?"'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Passe um trote para algum amigo que não está jogando'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description: 'Mostre para o grupo suas 3 últimas conversas do WhatsApp'),
  const CardModel(
      id: null,
      deck: 4,
      title: null,
      help: null,
      imagePath: null,
      description: 'Faça qualquer pessoa rir'),
  const CardModel(
      id: null,
      deck: 2,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Faça alguns shots com e sem alchool. Até a próxima rodada, cada jogador na sua vez toma um shot aleatório'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Você é um gringo! Até sua próxima rodada você fala outra língua apenas'),
  const CardModel(
      id: null,
      deck: 0,
      title: null,
      help: null,
      imagePath: null,
      description:
          'Sorria! Você está feliz, e agora não pode parar de sorrir até sua próxima rodada')
];
