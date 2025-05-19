import 'package:care/registration/registration_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../common/input_util.dart';
import '../common/input_validator.dart';
import 'otp_provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'OTP Confirmation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Text(
                        'A 6-digit OTP has been sent to your email.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Consumer(
                        builder: (context, ref, _) {
                          return PinCodeTextField(
                            appContext: context,
                            length: 6,
                            keyboardType: TextInputType.number,
                            enableActiveFill: true,
                            onChanged: (value) =>
                                ref.read(otpProvider.notifier).state = value,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(8),
                              fieldHeight: 50,
                              fieldWidth: 45,
                              borderWidth: 0.3,
                              activeFillColor: Colors.white,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              inactiveColor: Colors.black.withOpacity(0.5),
                              selectedColor: Colors.blue,
                              activeColor: Colors.blue,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Consumer(
                        builder: (context, ref, _) {
                          final timer = ref.watch(otpTimerProvider);

                          return Text(
                            "Time Left: ${_formatTime(timer)}",
                            style: const TextStyle(color: Colors.red),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Consumer(builder: (context, ref, _) {
                        final timer = ref.watch(otpTimerProvider);
                        final otp = ref.watch(otpProvider);
                        final isFilled = otp.length == 6;

                        return MaterialButton(
                          onPressed: (isFilled || timer == 0)
                              ? () {
                                  if (isFilled) {
                                    //ToDo: Validate OTP
                                  } else {
                                    //ToDo: Resend OTP
                                    ref.read(otpTimerProvider.notifier).reset();
                                  }
                                }
                              : null,
                          height: 50,
                          minWidth: double.maxFinite,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          color: const Color(0xFF13228C),
                          disabledColor: const Color(0xFFCDD8F0),
                          child: Text(
                            timer == 0 ? 'Resend' : 'Next',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;
    return '$minutes:${remaining.toString().padLeft(2, '0')}';
  }
}
