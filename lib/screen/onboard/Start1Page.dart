import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Start1Page extends StatelessWidget {

  final VoidCallback onNext;
  
  const Start1Page({
    super.key,
    required this.onNext,
    });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),

            Text(
              '마이팔',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            SvgPicture.asset(
              'assets/images/opening_background.svg',
              fit: BoxFit.contain,
            ),

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
    );
  }
}