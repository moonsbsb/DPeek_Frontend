import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mypal/theme/appcolor.dart';

class Start1Page extends StatelessWidget {

  final VoidCallback onNext;
  
  const Start1Page({
    super.key,
    required this.onNext,
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Appcolor.background,
        ),
        Positioned(
          left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/images/opening_background.svg',
              fit: BoxFit.contain,
            ),
          ),
          SafeArea(
            child: Stack(
            children: [
              Align(
                alignment: const FractionalOffset(0.5, 0.2),
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'D-Peek',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                children: [
                const Spacer(),

                  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: onNext,
                  child: const Text('시작하기'),
                ),
              ),

              const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    
    );
  }
}



