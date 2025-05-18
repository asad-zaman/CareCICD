class InputValidator {
  static String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password should be >= 6 digits';
    }

    return null; // valid
  }

  static String? validateConfirmPassword(normalValue, confirmValue) {
    if (confirmValue == null || confirmValue.isEmpty) {
      return 'Confirm Password is required';
    }

    if (normalValue != confirmValue) {
      return 'Password do not match';
    }

    return null; // valid
  }

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null; // valid
  }

  static String? validateMobile(value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }

    final pattern = RegExp(r'^(?:\+8801|8801|01)[3-9]\d{8}$');
    if (!pattern.hasMatch(value)) {
      return 'Enter a valid mobile number';
    }

    return null; // valid
  }
}
