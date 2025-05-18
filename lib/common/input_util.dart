import 'package:flutter/material.dart';

class InputUtil {
  static InputDecoration buildInputDecoration({
    required String? errorText,
    required bool isConfirm,
    required bool isObscure,
    required bool isMismatch,
    VoidCallback? toggleVisibility,
    String? labelText,
    Widget? prefixIcon,
  }) {
    final isError = errorText?.isNotEmpty ?? false;
    final isCorrect = errorText != null && errorText.isEmpty;

    return InputDecoration(
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (toggleVisibility != null)
            IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: toggleVisibility,
            ),
          if (isError)
            Tooltip(
              message: errorText,
              child: IconButton(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          if (isCorrect)
            Tooltip(
              message: errorText,
              child: IconButton(
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
        ],
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: isError ? Colors.red : Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isError ? Colors.red : Colors.blue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );
  }
}
