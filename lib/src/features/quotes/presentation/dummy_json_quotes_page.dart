import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/data/dummy_json_quote_domain.dart';

class DummyJsonQuotesPage extends ConsumerWidget {
  const DummyJsonQuotesPage({required this.data, super.key});

  final DummyJsonQuoteDomain data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //TODO: conectar ao provider

    return Scaffold(
      appBar: AppBar(title: Text('Dummy Json')),
      //TODO: Alterar tipo para AsyncValue
      body: Center(
        child: Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(data.id.toString())),
            title: Text(data.quote),
            subtitle: Text(data.author),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Alterar quote
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
