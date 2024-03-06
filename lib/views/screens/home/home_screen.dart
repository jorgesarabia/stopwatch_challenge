import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/utils/extensions/time_formatter_extension.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';
import 'package:stopwatch_challenge/views/widgets/app_button.dart';

part 'widgets/main_timer.dart';
part 'widgets/laps.dart';
part 'widgets/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          _MainTimer(),
          Expanded(child: _Laps()),
          _Buttons(),
        ],
      ),
    );
  }
}
