import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypal/theme/appcolor.dart';
import 'package:mypal/strings/OnboardingStrings.dart';

class Start3page extends StatelessWidget{

  final VoidCallback onNext;

  const Start3page({
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

            SvgPicture.asset(
              'assets/images/onboard_3.svg',
              fit: BoxFit.contain,
            ),
            
            Spacer(),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                Onbordingstrings.onboarding3Comment,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
                ),
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