import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/views/widgets/app_button.dart';

import '../screen_util_wrapper.dart';

class MockTapCallback extends Mock {
  void call();
}

void main() {
  testWidgets('AppButton displays correct label and color', (WidgetTester tester) async {
    final widget = ScreenUtilWrapper(
      widget: Column(
        children: [
          AppButton.start(onTap: () {}),
          AppButton.lap(isEnabled: true, onTap: () {}),
          AppButton.lap(isEnabled: false, onTap: () {}),
          AppButton.stop(onTap: () {}),
          AppButton.resume(onTap: () {}),
          AppButton.reset(onTap: () {}),
        ],
      ),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final start = find.text('Start');
    final lap = find.text('Lap');
    final stop = find.text('Stop');
    final resume = find.text('Resume');
    final reset = find.text('Reset');

    expect(start, findsOneWidget);
    expect(lap, findsNWidgets(2));
    expect(stop, findsOneWidget);
    expect(resume, findsOneWidget);
    expect(reset, findsOneWidget);

    expect(tester.widget<Text>(start).style?.color, Colors.white);
  });

  testWidgets('AppButton calls onTap callback when tapped', (WidgetTester tester) async {
    final mockCallback = MockTapCallback();
    final widget = ScreenUtilWrapper(
      widget: AppButton.start(
        onTap: mockCallback.call,
      ),
    );

    await tester.pumpWidget(widget);
    await tester.pump();

    final buttonFinder = find.text('Start');

    await tester.tap(buttonFinder);
    await tester.pump();

    verify(mockCallback.call()).called(1);
  });
}
