import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';
import 'package:stopwatch_challenge/models/timer_model.dart';
import 'package:stopwatch_challenge/utils/extensions/date_formatter_extension.dart';
import 'package:stopwatch_challenge/utils/extensions/time_formatter_extension.dart';
import 'package:stopwatch_challenge/views/screens/history/history_screen.dart';

import '../controllers/mock_stopwatch_controller.mocks.dart';
import '../screen_util_wrapper.dart';

void main() {
  late Widget widget;
  late MockStopwatchController mockStopwatchController;

  setUp(() {
    mockStopwatchController = MockStopwatchController();
    widget = ScreenUtilWrapper(
      controller: mockStopwatchController,
      widget: const Scaffold(body: HistoryScreen()),
    );
  });

  group('different views at main screen', () {
    testWidgets('shows No records saved if the list is empty', (tester) async {
      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.value([]));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final noRecords = find.text('No records saved');

      expect(noRecords, findsOneWidget);
      verify(mockStopwatchController.getSavedStopwatches()).called(1);
    });

    testWidgets('shows error if there is an error in the answer', (tester) async {
      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.error('Mock error'));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final error = find.text('Error: Mock error');

      expect(error, findsOneWidget);
      verify(mockStopwatchController.getSavedStopwatches()).called(1);
    });

    testWidgets('shows a list if there are some values in the storage', (tester) async {
      const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
      const stopwatchModel = StopwatchModel(
        mainTimer: timer,
        laps: [timer],
      );
      final savedStopwatch = SavedStopwatch(
        stopwatchModel: stopwatchModel,
        bestLap: 10,
        worstLap: 100,
        savedAt: DateTime.now(),
      );

      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.value([savedStopwatch]));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final card = find.byType(Card);

      expect(card, findsOneWidget);
      verify(mockStopwatchController.getSavedStopwatches()).called(1);
    });
  });

  group('on tapping', () {
    testWidgets('card must call loadSavedStopwatch', (tester) async {
      const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
      const stopwatchModel = StopwatchModel(
        mainTimer: timer,
        laps: [timer],
      );
      final savedStopwatch = SavedStopwatch(
        stopwatchModel: stopwatchModel,
        bestLap: 10,
        worstLap: 100,
        savedAt: DateTime.now(),
      );

      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.value([savedStopwatch]));
      when(mockStopwatchController.loadSavedStopwatch(savedStopwatch)).thenReturn(null);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final card = find.byType(Card);

      expect(card, findsOneWidget);

      await tester.tap(card);
      await tester.pump();

      verify(mockStopwatchController.getSavedStopwatches()).called(1);
      verify(mockStopwatchController.loadSavedStopwatch(savedStopwatch)).called(1);
    });

    testWidgets('on delete must call deleteHistory()', (tester) async {
      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.value([]));
      when(mockStopwatchController.deleteHistory()).thenAnswer((realInvocation) => Future.value());

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final delete = find.text('Delete all');

      expect(delete, findsOneWidget);

      await tester.tap(delete);
      await tester.pump();

      verify(mockStopwatchController.getSavedStopwatches()).called(2);
      verify(mockStopwatchController.deleteHistory()).called(1);
    });
  });

  group('checking card value', () {
    testWidgets('card must have all the information', (tester) async {
      const timer = TimerModel(totalMilliseconds: 10000, partialMilliseconds: 1000);
      const stopwatchModel = StopwatchModel(
        mainTimer: timer,
        laps: [timer],
      );
      final savedStopwatch = SavedStopwatch(
        stopwatchModel: stopwatchModel,
        bestLap: 10,
        worstLap: 100,
        savedAt: DateTime.now(),
      );

      when(mockStopwatchController.getSavedStopwatches()).thenAnswer((_) => Future.value([savedStopwatch]));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('Saved at:'.padRight(15)), findsOneWidget);
      expect(find.text('Total time:'.padRight(15)), findsOneWidget);
      expect(find.text('Best lap:'.padRight(15)), findsOneWidget);
      expect(find.text('Worst lap:'.padRight(15)), findsOneWidget);
      expect(find.text(savedStopwatch.savedAt.savedAtStyle), findsOneWidget);
      expect(find.text(timer.totalMilliseconds.toStopwatchStyle), findsOneWidget);
      expect(find.text(10.toStopwatchStyle), findsOneWidget);
      expect(find.text(100.toStopwatchStyle), findsOneWidget);

      verify(mockStopwatchController.getSavedStopwatches()).called(1);
    });
  });
}
