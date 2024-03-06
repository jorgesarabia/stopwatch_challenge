import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stopwatch_challenge/views/screens/history/history_screen.dart';
import 'package:stopwatch_challenge/views/screens/home/home_screen.dart';

part 'widgets/icon_button.dart';

class AppLandingScreen extends StatefulWidget {
  const AppLandingScreen({super.key});

  @override
  State<AppLandingScreen> createState() => _AppLandingScreenState();
}

class _AppLandingScreenState extends State<AppLandingScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _tabSections = <Widget>[
    HomeScreen(),
    HistoryScreen(),
  ];

  void _updateSelectedIndex(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabSections.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _IconButton(
                icon: Icons.timer,
                isSelected: _selectedIndex == 0,
                onPressed: () => _updateSelectedIndex(0),
                label: 'Stopwatch',
              ),
              _IconButton(
                icon: Icons.history,
                isSelected: _selectedIndex == 1,
                onPressed: () => _updateSelectedIndex(1),
                label: 'History',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
