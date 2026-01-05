import 'package:flutter/material.dart';
import 'package:mypal/screen/onboard/Start3Page.dart';
import 'package:mypal/screen/onboard/Start4Page.dart';
import 'Start1Page.dart';
import 'Start2Page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          Start1Page(onNext: _goNext),
          Start2Page(onNext: _goNext),
          Start3page(onNext: _goNext),
          Start4page(onNext: _goNext)
        ],
      ),
    );
  }

  void _goNext() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
