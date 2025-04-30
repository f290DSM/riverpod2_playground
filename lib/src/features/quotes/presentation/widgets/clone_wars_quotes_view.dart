import 'package:flutter/material.dart';

import '../../data/clone_wars_datasource.dart';
import 'clone_wars_quote_card_widget.dart';

class CloneWarsView extends StatelessWidget {
  const CloneWarsView({
    super.key, required this.seasons,
  });

  final List<Season> seasons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
