import 'package:flutter/material.dart';

class FilledCard extends StatelessWidget {
  final double elevation;
  final String label;

  const FilledCard({
    super.key,
    required this.elevation,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - filled"),
            ),
          ],
        ),
      ),
    );
  }
}
