import 'package:flutter/material.dart';
import 'package:mypal/screen/calendar/CalendarScreen.dart';
import 'package:mypal/screen/report/ReportScreen.dart';
import 'package:mypal/screen/setting/SettingScreen.dart';
import 'package:mypal/screen/write/WriteScreen.dart';
import 'package:mypal/theme/AppColor.dart';
import 'home/HomeScreen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    CalendarScreen(),
    WriteScreen(),
    ReportScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Appcolor.primary,
        unselectedItemColor: Appcolor.inactiveNav,
        showSelectedLabels: true,
        backgroundColor: Appcolor.subPrimary,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '달력'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '작성'
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '분석'
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '설정'
          ),
        ],
      ),
    );
  } 
}