import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceOptions = [
  'I want to book Care Giver for my family elderly member',
  'I want to book Nanny for my baby',
  'I want join as care giver for Ayat Care',
];

final selectedOptionProvider = StateProvider.autoDispose<int?>((ref) => null);
