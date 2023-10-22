import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jot_down/framework/presentation/home/home_page.dart';
import 'package:jot_down/framework/presentation/onboarding/slides.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  Color _color = Colors.red;
  var random = Random();

  @override
  Widget build(BuildContext context) {
    final items = [
      slideOne(),
      slideTwo(),
    ];
    return Scaffold(
      floatingActionButton: currentIndex == items.length - 1
          ? FloatingActionButton.large(
              child: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              })
          : null,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          // mainAxisSize:  MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _color = Color.fromARGB(random.nextInt(256),
                        random.nextInt(256), random.nextInt(256), 1);
                    currentIndex = index;
                  });
                },
                controller: PageController(initialPage: currentIndex),
                children: items,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < items.length; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: 14,
                    height: 14,
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      color: i == currentIndex ? _color : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
            ])
          ],
        ),
      ),
    );
  }
}
