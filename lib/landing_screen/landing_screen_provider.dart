import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedScreenProvider = StateProvider.autoDispose<int>((ref) => 0);
