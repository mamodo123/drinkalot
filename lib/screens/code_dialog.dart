import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manage_data.dart';
import '../models/deck.dart';

class CodeDialog extends StatefulWidget {
  const CodeDialog({super.key});

  @override
  State<CodeDialog> createState() => _CodeDialogState();
}

class _CodeDialogState extends State<CodeDialog> {
  final TextEditingController textController = TextEditingController();
  bool loading = false;

  final codes = [
    'to_get_very_drunk',
    'have_i_never_spice',
    'party_challenges',
    'sexual',
  ];

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: const Text('Código'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Digite o código',
                ),
                TextField(
                  controller: textController,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  final code = textController.text;
                  if (codes.contains(code)) {
                    buyDeck(code);
                    final decksNotifier = context.read<DeckListNotifier>();
                    await decksNotifier.reloadDecks();
                  }
                  setState(() {
                    loading = false;
                  });
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
  }
}
