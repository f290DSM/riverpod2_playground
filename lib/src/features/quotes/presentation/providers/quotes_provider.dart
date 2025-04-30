import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/clone_wars_datasource.dart';

part 'quotes_provider.g.dart';

Provider<List<Season>> cloneWarsQuotes = 
  Provider<List<Season>>((ref) {
  var json = jsonDecode(quotes);
  final datasource = CloneWarsQuotesDataSource(json);
  return datasource.seasons;
});

@riverpod
FutureOr<List<Season>> cloneWarsFutureQuotes(Ref ref) async {
  await Future.delayed(const Duration(seconds: 5));
  return ref.watch(cloneWarsQuotes);
}