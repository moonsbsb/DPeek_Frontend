import 'package:flutter/material.dart';
import 'package:mypal/model/MachineState.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Machinewithlever extends StatelessWidget{
  final Machinestate machineState;
  final VoidCallback onLeverTop;

  const Machinewithlever({
    super.key,
    required this.machineState,
    required this.onLeverTop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c){
        return Stack(
          children: [
            SvgPicture.asset(
              machineState.imagePath,
              fit: BoxFit.contain,
            ),

            Positioned(
              left: c.maxWidth * 0.38,
              top: c.maxHeight * 0.6,
              child: GestureDetector(
                onTap: onLeverTop,
                child: Container(
                  width: c.maxWidth * 0.2,
                  height: c.maxHeight * 0.18,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}