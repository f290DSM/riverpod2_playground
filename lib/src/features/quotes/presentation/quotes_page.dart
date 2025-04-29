import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/providers/quotes_provider.dart';

import 'widgets/clone_wars_quote_card_widget.dart';

class CloneWarsQuotesPage extends ConsumerWidget {
  const CloneWarsQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasons = ref.watch(cloneWarsQuotes);
    return Scaffold(
      appBar: AppBar(title: Text('Cloe Wars Quotes')),
      body: ListView.builder(
        itemCount: seasons.length,
        itemBuilder: (context, index) {
          final season = seasons[index];
          return ExpansionTile(
            title: Text('Season ${season.number}'),
            children:
                season.quotes.map((e) {
                  return CloneWarsQuoteCardWidget(quote: e);
                }).toList(),
          );
        },
      ),
    );
  }
}
