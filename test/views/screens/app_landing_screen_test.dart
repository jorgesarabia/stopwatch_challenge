import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/views/screens/app_landing/app_landing_screen.dart';

import '../controllers/mock_stopwatch_controller.mocks.dart';
import '../screen_util_wrapper.dart';

void main() {
  late Widget widget;
  late MockStopwatchController mockStopwatchController;

  setUp(() {
    mockStopwatchController = MockStopwatchController();
    widget = ScreenUtilWrapper(
      controller: mockStopwatchController,
      widget: const Scaffold(
        body: AppLandingScreen(
          tabs: [
            Center(child: Text('Tab one')),
            Center(child: Text('Tab two')),
          ],
        ),
      ),
    );
  });

  testWidgets('initialize in Tab one if tab is zero', (tester) async {
    when(mockStopwatchController.tab).thenReturn(0);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final tabOne = find.text('Tab one');

    expect(tabOne, findsOneWidget);
    verify(mockStopwatchController.tab).called(3);
  });

  testWidgets('initialize in Tab two if tab is one', (tester) async {
    when(mockStopwatchController.tab).thenReturn(1);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final tabTwo = find.text('Tab two');

    expect(tabTwo, findsOneWidget);
    verify(mockStopwatchController.tab).called(3);
  });

  testWidgets('change screen on tap icon', (tester) async {
    when(mockStopwatchController.tab).thenReturn(0);
    when(mockStopwatchController.updateTab(0)).thenReturn(null);
    when(mockStopwatchController.updateTab(1)).thenReturn(null);

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final timerIcon = find.byIcon(Icons.timer);
    final historyIcon = find.byIcon(Icons.history);

    expect(timerIcon, findsOneWidget);
    expect(historyIcon, findsOneWidget);

    verify(mockStopwatchController.tab).called(3);
    verifyNever(mockStopwatchController.updateTab(0));
    verifyNever(mockStopwatchController.updateTab(1));

    await tester.tap(historyIcon);
    await tester.tap(timerIcon);
    await tester.pump();

    verify(mockStopwatchController.updateTab(0)).called(1);
    verify(mockStopwatchController.updateTab(1)).called(1);
  });
}
