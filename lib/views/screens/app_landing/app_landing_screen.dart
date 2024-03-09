import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';
import 'package:stopwatch_challenge/views/screens/history/history_screen.dart';
import 'package:stopwatch_challenge/views/screens/home/home_screen.dart';

part 'widgets/icon_button.dart';

class AppLandingScreen extends StatefulWidget {
  const AppLandingScreen({
    super.key,
    this.tabs = const <Widget>[
      HomeScreen(),
      HistoryScreen(),
    ],
  });

  final List<Widget> tabs;

  @override
  State<AppLandingScreen> createState() => _AppLandingScreenState();
}

class _AppLandingScreenState extends State<AppLandingScreen> {
  late final List<Widget> _tabSections;

  @override
  void initState() {
    _tabSections = widget.tabs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StopwatchController>(
      builder: (context, stopwatchController, _) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(child: _tabSections.elementAt(stopwatchController.tab)),
              Container(
                color: Colors.grey.withOpacity(0.3),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _IconButton(
                        icon: Icons.timer,
                        isSelected: stopwatchController.tab == 0,
                        onPressed: () => stopwatchController.updateTab(0),
                        label: 'Stopwatch',
                      ),
                      _IconButton(
                        icon: Icons.history,
                        isSelected: stopwatchController.tab == 1,
                        onPressed: () => stopwatchController.updateTab(1),
                        label: 'History',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
