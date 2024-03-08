import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';

import 'controllers/mock_stopwatch_controller.mocks.dart';

class ScreenUtilWrapper extends StatelessWidget {
  const ScreenUtilWrapper({
    super.key,
    this.controller,
    required this.widget,
  });

  final Widget widget;
  final StopwatchController? controller;

  @override
  Widget build(BuildContext context) {
    const designSize = Size(1920, 1200);
    final stopwatchController = controller ?? MockStopwatchController();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => stopwatchController),
        StreamProvider<int>(create: (_) => stopwatchController.timerStream, initialData: 0),
      ],
      child: MediaQuery(
        data: const MediaQueryData(size: designSize),
        child: ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return MaterialApp(
              title: 'StopwatchTest',
              home: widget,
            );
          },
        ),
      ),
    );
  }
}
