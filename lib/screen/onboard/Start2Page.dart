import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mypal/theme/appcolor.dart';
import 'package:mypal/strings/OnboardingStrings.dart';

class Start2Page extends StatelessWidget{

  final VoidCallback onNext;

  const Start2Page({
    super.key,
    required this.onNext
  });

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.background,
      body: SafeArea(
          child: Column(
            children: [
              Spacer(),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: 
                  Text(
                    Onbordingstrings.onboarding2Comment,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              
              Spacer(),

              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/images/onboard_2.svg',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onNext, 
                  child: const Text(Onbordingstrings.nextBtn)
                 ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
      ),
    );
  }
}