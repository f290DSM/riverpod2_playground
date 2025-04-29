import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final primeiroProvider = Provider<String>((ref) => 'Meu Primeiro Provider');
final counterProvider = StateProvider<int>((ref) => 0);
final themeSwitchProvider = StateProvider<bool>((ref) => false);
final colorProvider = StateProvider<MaterialColor>((ref) => Colors.green);
