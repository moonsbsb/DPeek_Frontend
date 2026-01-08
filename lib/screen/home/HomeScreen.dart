import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypal/model/MachineState.dart';
import 'package:mypal/theme/AppColor.dart';
import 'package:mypal/theme/AppGradient.dart';
import 'package:mypal/theme/AppTextStyle.dart';
import 'MachineWithLever.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();

  

}

class _HomeScreen extends State<HomeScreen>{

  Machinestate machineState = Machinestate.empty; // 머신 이미지 상태
  int ticket = 3; // 티켓 수

  void _onLeverTop(){
    if(ticket <= 0) return;
    if(Machinestate == Machinestate.empty) return;

    setState(() {
      ticket --;
      _updateMachineState();
    });
  }

  void _updateMachineState(){
    if (ticket <= 0) {
      machineState = Machinestate.empty;
    } else if (ticket == 1) {
      machineState = Machinestate.quater;
    } else if (ticket == 2) {
      machineState = Machinestate.half;
    } else {
      machineState = Machinestate.full;
    }
  }

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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: AspectRatio(
                    aspectRatio: 3/4,
                    child: Machinewithlever(
                      machineState: machineState,
                      onLeverTop: _onLeverTop,
                    ),
                  ),
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}

