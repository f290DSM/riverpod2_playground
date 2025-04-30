import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/domain/dummy_json_quote_domain.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/providers/quotes_provider.dart';

class DummyJsonQuotesPage extends ConsumerWidget {
  const DummyJsonQuotesPage({required this.data, super.key});

  final DummyJsonQuoteDomain data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: conectar ao provider
    final quote = ref.watch(dummyJsonQuoteProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Dummy Json')),
      //TODO: Alterar tipo para AsyncValue
      body: quote.when(
        data: (data) {
          return Center(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(child: Text(data.id.toString())),
                title: Text(data.quote),
                subtitle: Text(data.author),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Alterar quote
          ref.invalidate(dummyJsonQuoteProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
