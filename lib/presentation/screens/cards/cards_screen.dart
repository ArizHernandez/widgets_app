import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/cards/cards.dart';

const List<Map<String, dynamic>> cards = [
  {"elevation": 0.0, "label": "Elevation 0"},
  {"elevation": 1.0, "label": "Elevation 1"},
  {"elevation": 2.0, "label": "Elevation 2"},
  {"elevation": 3.0, "label": "Elevation 3"},
  {"elevation": 4.0, "label": "Elevation 4"},
  {"elevation": 5.0, "label": "Elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map(
              (card) => SimpleCard(
                elevation: card["elevation"],
                label: card["label"],
              ),
            ),
            const SizedBox(height: 20),
            ...cards.map(
              (card) => BorderedCard(
                elevation: card["elevation"],
                label: card["label"],
              ),
            ),
            const SizedBox(height: 20),
            ...cards.map(
              (card) => FilledCard(
                elevation: card["elevation"],
                label: card["label"],
              ),
            ),
            const SizedBox(height: 20),
            ...cards.map(
              (card) => ImageCard(
                elevation: card["elevation"],
                label: card["label"],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
