import 'package:care/home_screen/home_screen.dart';
import 'package:care/landing_screen/caregiver_screen.dart';
import 'package:care/landing_screen/service_screen.dart';
import 'package:care/landing_screen/landing_screen_provider.dart';
import 'package:care/landing_screen/vision_screen.dart';
import 'package:care/service_selection/service_selection_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceSelectionScreen extends StatelessWidget {
  const ServiceSelectionScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 80, 80, 0),
              child: Image.asset('assets/images/ic_app_logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'So what service you want to take from us?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Select one',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Consumer(builder: (context, ref, _) {
                return _serviceOptions();
              }),
            ),
            _actionButton(),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen())),
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

  Widget _serviceOptions() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Consumer(builder: (context, ref, _) {
        final selectedIndex = ref.watch(selectedOptionProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(serviceOptions.length, (index) {
            final isSelected = selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Chip(
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                backgroundColor:
                    isSelected ? const Color(0xFF318DA7) : Colors.white,
                label: InkWell(
                  onTap: () {
                    ref.read(selectedOptionProvider.notifier).state = index;
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      serviceOptions[index],
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _actionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Consumer(builder: (context, ref, _) {
        final seletedIndex = ref.watch(selectedOptionProvider);

        return MaterialButton(
          onPressed: seletedIndex != null ? () {} : null,
          height: 50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          color: const Color(0xFF13228C),
          disabledColor: const Color(0xFFCDD8F0),
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
