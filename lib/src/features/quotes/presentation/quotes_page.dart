import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/quotes/domain/dummy_json_quote_domain.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/clone_wars_quotes_page.dart';
import 'package:riverpod2_playground/src/features/quotes/presentation/dummy_json_quotes_page.dart';

class QuotesPage extends ConsumerWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Clone Wars Quotes')),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.android),
            title: Text('Clone wars'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CloneWarsQuotesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Dummy Json'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DummyJsonQuotesPage(
                        data: DummyJsonQuoteDomain(
                          id: 1,
                          quote: 'Mussum ipsum cacildis vidis litrus abertis.',
                          author: 'Mussum',
                        ),
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
