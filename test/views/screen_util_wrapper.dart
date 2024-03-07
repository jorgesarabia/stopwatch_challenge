import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilWrapper extends StatelessWidget {
  const ScreenUtilWrapper({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    const designSize = Size(1920, 1200);

    return MediaQuery(
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
    );
  }
}
