import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the OTP input from the user
final otpProvider = StateProvider<String>((ref) => '');

/// Countdown state (in seconds)
final otpTimerProvider = StateNotifierProvider<OtpTimerNotifier, int>((ref) {
  return OtpTimerNotifier();
});

class OtpTimerNotifier extends StateNotifier<int> {
  static const int _initial = 90;
  Timer? _timer;

  OtpTimerNotifier() : super(_initial) {
    _start();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state <= 0) {
        timer.cancel();
      } else {
        state--;
      }
    });
  }

  void reset() {
    _timer?.cancel();
    state = _initial;
    _start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
