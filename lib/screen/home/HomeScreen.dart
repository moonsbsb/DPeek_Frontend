import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypal/model/MachineState.dart';
import 'package:mypal/theme/AppColor.dart';
import 'package:mypal/theme/AppGradient.dart';
import 'package:mypal/theme/AppTextStyle.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{

  Machinestate machineState = Machinestate.empty; // 머신 이미지 상태
  int ticket = 0; // 티켓 수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: Appgradient.home,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const SizedBox.expand(),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Appcolor.table
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: const FractionalOffset(0.03, 0.05),
                  child: SvgPicture.asset(
                    'assets/images/ticket_frame.svg',
                    fit: BoxFit.contain,
                  ),
                )
              ),

              Align(
                alignment: const FractionalOffset(0.19, 0.055),
                child: Text(
                '${ticket}',
                style: TextStyle(
                  color: Appcolor.background,
                  fontSize: 13,
                  fontWeight: FontWeight.normal                  
                  ),
                ),
              ),

              Align(
                alignment: const FractionalOffset(0.5, 0.55),
                child: SvgPicture.asset(
                machineState.imagePath,
                fit: BoxFit.contain,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}