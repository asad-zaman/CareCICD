import 'package:care/home_screen/home_screen.dart';
import 'package:care/landing_screen/caregiver_screen.dart';
import 'package:care/landing_screen/service_screen.dart';
import 'package:care/landing_screen/landing_screen_provider.dart';
import 'package:care/landing_screen/vision_screen.dart';
import 'package:care/service_selection/service_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreenDashboard extends StatelessWidget {
  const LandingScreenDashboard({super.key});

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
        child: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, _) {
                return PageView(
                  children: const [
                    VisionScreen(),
                    ServiceScreen(),
                    CaregiverScreen(),
                  ],
                  onPageChanged: (value) {
                    ref.read(selectedScreenProvider.notifier).state = value;
                  },
                );
              }),
            ),
            _pageIndicator(),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServiceSelectionScreen())),
                child: const Text(
                  'Skip for Now',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageIndicator() {
    return Consumer(builder: (context, ref, _) {
      final selectedIndex = ref.watch(selectedScreenProvider);

      return Wrap(
        alignment: WrapAlignment.center,
        children:
            List.generate(3, (index) => _indicator(index == selectedIndex)),
      );
    });
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 10,
        width: isActive ? 50 : 10,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isActive ? const Color(0XFF318DA7) : const Color(0XFF6BC4C9),
        ),
      ),
    );
  }
}
