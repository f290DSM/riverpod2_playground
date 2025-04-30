import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/clone_wars_datasource.dart';
import 'package:http/http.dart';

import '../../domain/dummy_json_quote_domain.dart';

part 'quotes_provider.g.dart';

Provider<List<Season>> cloneWarsQuotes = Provider<List<Season>>((ref) {
  var json = jsonDecode(quotes);
  final datasource = CloneWarsQuotesDataSource(json);
  return datasource.seasons;
});

@riverpod
FutureOr<List<Season>> cloneWarsFutureQuotes(Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return ref.watch(cloneWarsQuotes);
}

//TODO: Criar DummyJson Provider
@riverpod
FutureOr<DummyJsonQuoteDomain> dummyJsonQuote(Ref ref) async {
  var response = await get(Uri.parse('https://dummyjson.com/quotes/random'));
  if (response.statusCode == 200) {
    return DummyJsonQuoteDomain.fromJson(response.body);
  }

  throw Exception('Failed to load quote');
}
