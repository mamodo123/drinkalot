import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/pair.dart';

class CreateCardDialog extends StatefulWidget {
  final CardModel? card;

  const CreateCardDialog({super.key, required this.card});

  @override
  State<CreateCardDialog> createState() => _CreateCardDialogState();
}

class _CreateCardDialogState extends State<CreateCardDialog> {
  late final TextEditingController textController;
  bool loading = false;

  @override
  void initState() {
    textController =
        TextEditingController(text: widget.card?.description ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AlertDialog(
            title: Text('${widget.card == null ? 'Criar' : 'Editar'} carta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Descrição',
                ),
                TextField(
                  maxLines: null,
                  controller: textController,
                ),
              ],
            ),
            actions: <Widget>[
              if (widget.card != null)
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(Pair(widget.card!, true));
                    },
                    child: const Text(
                      'Excluir',
                      style: TextStyle(color: Colors.red),
                    )),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  final description = textController.text;

                  setState(() {
                    loading = false;
                  });
                  if (context.mounted) {
                    final card = widget.card == null
                        ? CardModel(
                            id: null,
                            deck: -1,
                            title: null,
                            help: null,
                            imagePath: null,
                            description: description)
                        : CardModel(
                            id: widget.card!.id,
                            deck: widget.card!.deck,
                            title: widget.card!.title,
                            help: widget.card!.help,
                            imagePath: widget.card!.imagePath,
                            description: description);
                    Navigator.of(context).pop(Pair(card, false));
                  }
                },
              ),
            ],
          );
  }
}
