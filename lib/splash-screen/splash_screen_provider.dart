import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = StateNotifierProvider<SplashStateNotifier, bool>(
    (ref) => SplashStateNotifier());

class SplashStateNotifier extends StateNotifier<bool> {
  SplashStateNotifier() : super(false) {
    _init();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 5));
    state = true;
  }
}
