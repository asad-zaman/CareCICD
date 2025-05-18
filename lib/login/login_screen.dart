import 'package:care/registration/registration_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/input_util.dart';
import '../common/input_validator.dart';
import 'login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFC6CDFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(80),
                    child: Image.asset('assets/images/ic_app_logo.png'),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Log In',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Consumer(builder: (context, ref, _) {
                            final errorText = ref.watch(emailErrorProvider);

                            return TextFormField(
                              obscureText: false,
                              decoration: InputUtil.buildInputDecoration(
                                labelText: 'Email',
                                errorText: errorText,
                                prefixIcon: const Icon(Icons.email_outlined),
                                isConfirm: true,
                                isMismatch: true,
                                isObscure: false,
                              ),
                              validator: (value) =>
                                  InputValidator.validateEmail(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                ref.read(emailProvider.notifier).state = value;
                              },
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Consumer(builder: (context, ref, _) {
                            final isPasswordObscure =
                                ref.watch(passwordObscureStateProvider);
                            final errorText = ref.watch(passwordErrorProvider);

                            return TextFormField(
                              obscureText: isPasswordObscure,
                              decoration: InputUtil.buildInputDecoration(
                                labelText: 'Password',
                                errorText: errorText,
                                prefixIcon: const Icon(Icons.lock_outline),
                                isConfirm: true,
                                isMismatch: true,
                                isObscure: isPasswordObscure,
                                toggleVisibility: () {
                                  ref
                                      .read(
                                          passwordObscureStateProvider.notifier)
                                      .state = !isPasswordObscure;
                                },
                              ),
                              validator: (value) =>
                                  InputValidator.validatePassword(value),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                ref.read(passwordProvider.notifier).state =
                                    value;
                              },
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Consumer(builder: (context, ref, _) {
                                    final rememberMe =
                                        ref.watch(rememberMeProvider);

                                    return Checkbox(
                                      value: rememberMe,
                                      onChanged: (value) {
                                        ref
                                            .read(rememberMeProvider.notifier)
                                            .state = value ?? false;
                                      },
                                    );
                                  }),
                                  const Text('Remember Me'),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Consumer(builder: (context, ref, _) {
                            return MaterialButton(
                              onPressed: () {},
                              height: 50,
                              minWidth: double.maxFinite,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              color: const Color(0xFF13228C),
                              disabledColor: const Color(0xFFCDD8F0),
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: RichText(
                            text: TextSpan(
                                text: 'Don’t have any account? ',
                                style: const TextStyle(color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        
                                      },
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(thickness: 1, color: Colors.white)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Or",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const Expanded(
                            child: Divider(thickness: 1, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _socialButton(
                          iconPath: 'assets/images/ic_google.png',
                          label: 'Google',
                          onTap: () {},
                        ),
                        const SizedBox(width: 16),
                        _socialButton(
                          iconPath: 'assets/images/ic_facebook.png',
                          label: 'Facebook',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(iconPath, height: 24, width: 24),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}
