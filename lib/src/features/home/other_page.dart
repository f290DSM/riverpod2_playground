import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/home/providers/app_provider.dart';

class CloneWarsQuotesPage extends ConsumerWidget {
  const CloneWarsQuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close Wars Quotes'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(child: Text(ref.watch(counterProvider).toString())),
    );
  }
}
