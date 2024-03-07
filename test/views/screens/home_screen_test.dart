import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_challenge/views/screens/home/home_screen.dart';

import '../screen_util_wrapper.dart';

void main() {
  late Widget widget;

  setUp(() {
    widget = const ScreenUtilWrapper(
      widget: Scaffold(body: HomeScreen()),
    );
  });

  testWidgets('Initial home screen', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final start = find.text('Start');
    final lap = find.text('Lap');
    final timer = find.text('00:00.0');

    // expect(start, findsOneWidget);
    // expect(lap, findsOneWidget);
    // expect(timer, findsOneWidget);
  });
}
