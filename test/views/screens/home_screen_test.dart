import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';
import 'package:stopwatch_challenge/utils/extensions/time_formatter_extension.dart';
import 'package:stopwatch_challenge/views/screens/home/home_screen.dart';

import '../controllers/mock_stopwatch_controller.mocks.dart';
import '../screen_util_wrapper.dart';

void main() {
  late Widget widget;
  late MockStopwatchController mockStopwatchController;

  setUp(() {
    mockStopwatchController = MockStopwatchController();
    widget = ScreenUtilWrapper(
      controller: mockStopwatchController,
      widget: const Scaffold(body: HomeScreen()),
    );
  });

  testWidgets('initial home screen', (tester) async {
    when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(0));
    when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
    when(mockStopwatchController.isZero).thenReturn(true);
    when(mockStopwatchController.isStopped).thenReturn(false);
    when(mockStopwatchController.isRuning).thenReturn(false);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final timer = find.text(0.toStopwatchStyle);
    final start = find.text('Start');
    final lap = find.text('Lap');
    final stop = find.text('Stop');
    final resume = find.text('Resume');
    final reset = find.text('Reset');

    expect(timer, findsOneWidget);
    expect(start, findsOneWidget);
    expect(lap, findsOneWidget);
    expect(stop, findsNothing);
    expect(resume, findsNothing);
    expect(reset, findsNothing);
  });

  testWidgets('home screen when the stopwatch is running', (tester) async {
    when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(1500));
    when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
    when(mockStopwatchController.isZero).thenReturn(false);
    when(mockStopwatchController.isStopped).thenReturn(false);
    when(mockStopwatchController.isRuning).thenReturn(true);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final timer = find.text(1500.toStopwatchStyle);
    final start = find.text('Start');
    final lap = find.text('Lap');
    final stop = find.text('Stop');
    final resume = find.text('Resume');
    final reset = find.text('Reset');

    expect(timer, findsOneWidget);
    expect(start, findsNothing);
    expect(lap, findsOneWidget);
    expect(stop, findsOneWidget);
    expect(resume, findsNothing);
    expect(reset, findsNothing);
  });

  testWidgets('home screen when the stopwatch is stopped', (tester) async {
    when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(1500));
    when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
    when(mockStopwatchController.isZero).thenReturn(false);
    when(mockStopwatchController.isStopped).thenReturn(true);
    when(mockStopwatchController.isRuning).thenReturn(false);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final timer = find.text(1500.toStopwatchStyle);
    final start = find.text('Start');
    final lap = find.text('Lap');
    final stop = find.text('Stop');
    final resume = find.text('Resume');
    final reset = find.text('Reset');

    expect(timer, findsOneWidget);
    expect(start, findsNothing);
    expect(lap, findsNothing);
    expect(stop, findsNothing);
    expect(resume, findsOneWidget);
    expect(reset, findsOneWidget);
  });
}
