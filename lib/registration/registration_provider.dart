import '../common/input_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalPasswordObscureStateProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final confirmPasswordObscureStateProvider =
    StateProvider.autoDispose<bool>((ref) => true);
final normalPasswordProvider =
    StateProvider.autoDispose<String?>((ref) => null);
final confirmPasswordProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final normalPasswordErrorProvider = StateProvider.autoDispose<String?>((ref) {
  final passwordValue = ref.watch(normalPasswordProvider);

  if (passwordValue == null) {
    return null;
  } else {
    return InputValidator.validatePassword(passwordValue) ?? '';
  }
});

final confirmPasswordErrorProvider = StateProvider.autoDispose<String?>((ref) {
  final normalPasswordValue = ref.watch(normalPasswordProvider);
  final confirmPasswordValue = ref.watch(confirmPasswordProvider);

  if (confirmPasswordValue == null) {
    return null;
  } else {
    return InputValidator.validateConfirmPassword(
            normalPasswordValue, confirmPasswordValue) ??
        '';
  }
});

final emailErrorProvider = StateProvider.autoDispose<String?>((ref) {
  final emailValue = ref.watch(emailProvider);

  if (emailValue == null) {
    return null;
  } else {
    return (InputValidator.validateEmail(emailValue) ?? '');
  }
});
final emailProvider = StateProvider.autoDispose<String?>((ref) => null);

final mobileErrorProvider = StateProvider.autoDispose<String?>((ref) {
  final mobileValue = ref.watch(mobileProvider);

  if (mobileValue == null) {
    return null;
  } else {
    return (InputValidator.validateMobile(mobileValue) ?? '');
  }
});
final mobileProvider = StateProvider.autoDispose<String?>((ref) => null);
