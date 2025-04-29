import 'package:flutter/material.dart';
import 'package:riverpod2_playground/src/features/quotes/data/clone_wars_datasource.dart';

class CloneWarsQuoteCardWidget extends StatelessWidget {
  const CloneWarsQuoteCardWidget({super.key, required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            quote.episode.substring(
              quote.episode.length - 3,
              quote.episode.length,
            ),
          ),
        ),
        title: Text(quote.quote),
        subtitle: Text(quote.episode),
      ),
    );
  }
}
