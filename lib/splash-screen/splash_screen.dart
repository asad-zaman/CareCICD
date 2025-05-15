import 'package:care/landing_screen/landing_screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'splash_screen_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/images/ic_app_logo.png'),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Consumer(builder: (context, ref, _) {
              ref.listen(isLoadingProvider, (previous, next) {
                if (next) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LandingScreenDashboard()));
                }
              });
              return Image.asset(
                'assets/images/ic_loading.gif',
                height: 100,
              );
            }),
          )
        ],
      ),
    );
  }
}
