import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';
import 'package:stopwatch_challenge/models/timer_model.dart';
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

  group('home screen different states', () {
    testWidgets('initial home screen', (tester) async {
      when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(0));
      when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
      when(mockStopwatchController.isZero).thenReturn(true);
      when(mockStopwatchController.isStopped).thenReturn(false);
      when(mockStopwatchController.isRuning).thenReturn(false);
      when(mockStopwatchController.getLap()).thenReturn(null);
      when(mockStopwatchController.start()).thenReturn(null);

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

      await tester.tap(lap);
      await tester.pump();

      verifyNever(mockStopwatchController.getLap());

      await tester.tap(start);
      await tester.pump();

      verify(mockStopwatchController.start()).called(1);
    });

    testWidgets('home screen when the stopwatch is running', (tester) async {
      when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(1500));
      when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
      when(mockStopwatchController.isZero).thenReturn(false);
      when(mockStopwatchController.isStopped).thenReturn(false);
      when(mockStopwatchController.isRuning).thenReturn(true);
      when(mockStopwatchController.getLap()).thenReturn(null);
      when(mockStopwatchController.stop()).thenReturn(null);

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

      await tester.tap(lap);
      await tester.pump();

      verify(mockStopwatchController.getLap()).called(1);

      await tester.tap(stop);
      await tester.pump();

      verify(mockStopwatchController.stop()).called(1);
    });

    testWidgets('home screen when the stopwatch is stopped', (tester) async {
      when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(1500));
      when(mockStopwatchController.stopwatchModel).thenReturn(StopwatchModel.empty());
      when(mockStopwatchController.isZero).thenReturn(false);
      when(mockStopwatchController.isStopped).thenReturn(true);
      when(mockStopwatchController.isRuning).thenReturn(false);
      when(mockStopwatchController.start()).thenReturn(null);
      when(mockStopwatchController.reset()).thenReturn(null);

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

      await tester.tap(resume);
      await tester.pump();

      verify(mockStopwatchController.start()).called(1);

      await tester.tap(reset);
      await tester.pump();

      verify(mockStopwatchController.reset()).called(1);
    });
  });

  testWidgets('check secondary time widget', (tester) async {
    const milliseconds = 1500;
    const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
    const stopwatchModel = StopwatchModel(
      mainTimer: timer,
      laps: [timer],
    );

    when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(milliseconds));
    when(mockStopwatchController.stopwatchModel).thenReturn(stopwatchModel);
    when(mockStopwatchController.isZero).thenReturn(false);
    when(mockStopwatchController.isStopped).thenReturn(true);
    when(mockStopwatchController.isRuning).thenReturn(false);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final timeDiff = milliseconds - stopwatchModel.mainTimer.totalMilliseconds;
    final secondaryTimer = find.text(timeDiff.toStopwatchStyle);

    expect(stopwatchModel.laps.isNotEmpty, isTrue);
    expect(secondaryTimer, findsOneWidget);
  });

  group('the best lap and the worst lap ', () {
    void testRowColor(Table tableWidget, String textValue, Color matchColor) {
      TableRow? tableRow;
      for (final row in tableWidget.children) {
        final tableRowChildren = row.children;
        for (final child in tableRowChildren) {
          if ((child as Text).data == textValue) {
            tableRow = row;
            break;
          }
        }
        if (tableRow != null) {
          break;
        }
      }

      expect(tableRow, isNotNull);
      expect((tableRow?.decoration as BoxDecoration).color, matchColor);
    }

    testWidgets('exists and are highlighted', (tester) async {
      const milliseconds = 1500;
      const timer = TimerModel(totalMilliseconds: 500000, partialMilliseconds: 100000);
      const bestLap = TimerModel(totalMilliseconds: 5000, partialMilliseconds: 1000);
      const worstLap = TimerModel(totalMilliseconds: 50000, partialMilliseconds: 10000);
      const stopwatchModel = StopwatchModel(
        mainTimer: timer,
        laps: [timer, bestLap, worstLap],
      );

      when(mockStopwatchController.timerStream).thenAnswer((_) => Stream.value(milliseconds));
      when(mockStopwatchController.stopwatchModel).thenReturn(stopwatchModel);
      when(mockStopwatchController.isZero).thenReturn(false);
      when(mockStopwatchController.isStopped).thenReturn(true);
      when(mockStopwatchController.isRuning).thenReturn(false);
      when(mockStopwatchController.bestLap).thenReturn(1000);
      when(mockStopwatchController.worstLap).thenReturn(10000);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final bestLapFinder = find.text(bestLap.partialMilliseconds.toStopwatchStyle);
      final worstLapFinder = find.text(worstLap.partialMilliseconds.toStopwatchStyle);

      expect(bestLapFinder, findsOneWidget);
      expect(worstLapFinder, findsOneWidget);

      final table = find.ancestor(of: bestLapFinder, matching: find.byType(Table));
      expect(table, findsOneWidget);

      final tableWidget = tester.widget<Table>(table);

      testRowColor(tableWidget, bestLap.partialMilliseconds.toStopwatchStyle, Colors.green);
      testRowColor(tableWidget, worstLap.partialMilliseconds.toStopwatchStyle, Colors.red);
    });
  });
}
