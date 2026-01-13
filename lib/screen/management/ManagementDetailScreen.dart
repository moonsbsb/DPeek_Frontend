import 'package:flutter/material.dart';
import 'package:mypal/theme/AppColor.dart';

class ManagemeneDetailScreen extends StatefulWidget{
  const ManagemeneDetailScreen({super.key});

  @override
  State<ManagemeneDetailScreen> createState() => _ManagemeneDetailScreen();
}

class _ManagemeneDetailScreen extends State<ManagemeneDetailScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.lightGrey,
    );
  }
}