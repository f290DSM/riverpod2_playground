import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/providers/quotes_provider.dart';

class CloneWarsQuotesPage extends ConsumerWidget {
  const CloneWarsQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotes = ref.watch(cloneWarsQuotes);
    return Scaffold(
      appBar: AppBar(title: Text('Cloe Wars Quotes')),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Placeholder();
        },
      ),
    );
  }
}
