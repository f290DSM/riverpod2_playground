import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/providers/quotes_provider.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/widgets/clone_wars_quotes_view.dart';

class CloneWarsQuotesPage extends ConsumerWidget {
  const CloneWarsQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasons = ref.watch(cloneWarsFutureQuotesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Clone Wars Quotes')),
      body: seasons.when(
        data: (data) => CloneWarsView(seasons: data),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
