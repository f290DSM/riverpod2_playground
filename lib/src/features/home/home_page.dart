import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_playground/src/features/counter/counter_page.dart';
import 'package:riverpod2_playground/src/features/home/other_page.dart';
import 'package:riverpod2_playground/src/features/home/providers/app_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text('Primeiro Provider'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeSwitchProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              ref.watch(themeSwitchProvider)
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          PopupMenuButton(
            itemBuilder:
                (context) => [
                  for (final c in Colors.primaries)
                    PopupMenuItem(
                      value: c,
                      child: Icon(Icons.color_lens_rounded, color: c),
                    ),
                ],
            icon: Icon(Icons.color_lens_rounded),
            onSelected: (color) {
              ref.read(colorProvider.notifier).update((state) => color);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ref.watch(primeiroProvider),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CloneWarsQuotesPage(),
                  ),
                );
              },
              title: Text('Quotes Page'),
              leading: Icon(Icons.format_quote),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterPage()),
                );
              },
              title: Text('Counter Page'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
