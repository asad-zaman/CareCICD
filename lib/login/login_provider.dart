import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/input_validator.dart';

final passwordObscureStateProvider = StateProvider<bool>((ref) => true);
final passwordErrorProvider = StateProvider<String?>((ref) {
  final passwordValue = ref.watch(passwordProvider);

  if (passwordValue == null) {
    return null;
  } else {
    return InputValidator.validatePassword(passwordValue) ?? '';
  }
});
final passwordProvider = StateProvider<String?>((ref) => null);
final emailErrorProvider = StateProvider<String?>((ref) {
  final emailValue = ref.watch(emailProvider);

  if (emailValue == null) {
    return null;
  } else {
    return (InputValidator.validateEmail(emailValue) ?? '');
  }
});
final emailProvider = StateProvider<String?>((ref) => null);

final rememberMeProvider = StateProvider<bool>((ref) => false);
