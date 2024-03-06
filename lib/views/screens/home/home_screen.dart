import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/utils/injectable/injectable.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';
import 'package:stopwatch_challenge/views/widgets/app_button.dart';

part 'widgets/main_timer.dart';
part 'widgets/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt.get<StopwatchController>(),
      child: const SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              _MainTimer(),
              _Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
