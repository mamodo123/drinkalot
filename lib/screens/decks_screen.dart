import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:drinkalot/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../const/consts.dart';
import '../functions.dart';

class DecksScreen extends StatefulWidget {
  const DecksScreen({super.key});

  @override
  State<DecksScreen> createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  int _currentIndex = 0;
  late Future<List<ProductDetails>?> products;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  Future<List<ProductDetails>?> loadProducts(BuildContext context) async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (available && context.mounted) {
      final decksNotifier = context.read<DeckListNotifier>();
      final decks = decksNotifier.decks;
      final Set<String> kIds = decks
          .map((e) => e.playstoreId)
          .where((element) => element != null)
          .map((e) => e!)
          .toSet();
      final ProductDetailsResponse response =
          await InAppPurchase.instance.queryProductDetails(kIds);
      List<ProductDetails> products = response.productDetails;
      return products;
    }
    return null;
  }

  void configPurchaseStream() {
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList, context);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList, BuildContext context) async {
    await Future.forEach(
        purchaseDetailsList,
        (element) => (PurchaseDetails purchaseDetails) async {
              if (purchaseDetails.status == PurchaseStatus.pending) {
                // _showPendingUI();
              } else {
                if (purchaseDetails.status == PurchaseStatus.error) {
                  // _handleError(purchaseDetails.error!);
                } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                    purchaseDetails.status == PurchaseStatus.restored) {
                  // bool valid = await _verifyPurchase(purchaseDetails);
                  // if (valid) {
                  //   _deliverProduct(purchaseDetails);
                  // } else {
                  //   _handleInvalidPurchase(purchaseDetails);
                  // }
                }
                if (purchaseDetails.pendingCompletePurchase) {
                  await InAppPurchase.instance
                      .completePurchase(purchaseDetails);
                }
              }
            });
    if (purchaseDetailsList.isNotEmpty) {
      if (context.mounted) {
        final decksNotifier = context.read<DeckListNotifier>();
        await decksNotifier.reloadDecks();
      }
    }
  }

  @override
  void initState() {
    configPurchaseStream();
    products = loadProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final decksNotifier = context.watch<DeckListNotifier>();
    final decks =
        decksNotifier.decks.where((element) => element.id != -1).toList();
    return FutureBuilder<List<ProductDetails>?>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Drinkalot',
                      style:
                          TextStyle(color: red, fontFamily: font, fontSize: 40),
                    ),
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                          options: CarouselOptions(
                            height: 500,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: decks.map((deck) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.625, horizontal: 10),
                                  child: AspectRatio(
                                    aspectRatio: 0.64,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: darkenColor(
                                                        deck.color, .3),
                                                    width: 5),
                                                color: deck.color,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            alignment: Alignment.center,
                                            child: Stack(
                                              children: [
                                                if (deck.backgroundImage !=
                                                    null)
                                                  SvgPicture.asset(
                                                    deck.backgroundImage!,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .white
                                                                .withOpacity(
                                                                    .15),
                                                            BlendMode.srcIn),
                                                  ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      deck.title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 40,
                                                          color: Colors.white,
                                                          fontFamily: font,
                                                          height: 0.8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (deck.hasBought)
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      'Já adquirido',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList()),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: decks[_currentIndex].hasBought
                              ? null
                              : () async {
                                  final productDetails = snapshot.data!
                                      .firstWhere((element) =>
                                          element.id ==
                                          decks[_currentIndex].playstoreId);
                                  final PurchaseParam purchaseParam =
                                      PurchaseParam(
                                          productDetails: productDetails);
                                  await InAppPurchase.instance.buyConsumable(
                                      purchaseParam: purchaseParam);
                                },
                          child: const Text('Comprar'))
                    ],
                  ));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
