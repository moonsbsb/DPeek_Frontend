import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mypal/theme/appcolor.dart';
import 'package:mypal/strings/OnboardingStrings.dart';

class Start4page extends StatelessWidget{
  
  final VoidCallback onNext;
  
  const Start4page({
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
                  alignment: Alignment.centerRight,
                  child: 
                  Text(
                    Onbordingstrings.onboarding4Comment,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/images/onboard_4.svg',
                  fit: BoxFit.contain,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onNext, 
                  child: const Text(Onbordingstrings.startBtn)
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