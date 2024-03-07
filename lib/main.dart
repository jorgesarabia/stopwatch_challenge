import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/views/screens/app_landing/app_landing_screen.dart';

import 'utils/injectable/injectable.dart';
import 'views/controllers/stopwatch_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const Stopwatch());
}

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    final stopwatchController = getIt.get<StopwatchController>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => stopwatchController),
        StreamProvider<int>(create: (_) => stopwatchController.timerStream, initialData: 0),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            title: 'Stopwatch',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const AppLandingScreen(),
          );
        },
      ),
    );
  }
}
