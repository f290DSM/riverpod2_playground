import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/clone_wars_datasource.dart';

Provider<List<Season>> cloneWarsQuotes = 
  Provider<List<Season>>((ref) {
  var json = jsonDecode(quotes);
  final datasource = CloneWarsQuotesDataSource(json);
  return datasource.seasons;
});