part of '../history_screen.dart';

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.savedStopwatch});

  final SavedStopwatch savedStopwatch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HistoryRow(label: 'Saved at:', value: savedStopwatch.savedAt.savedAtStyle),
              _HistoryRow(
                label: 'Total time:',
                value: savedStopwatch.stopwatchModel.mainTimer.totalMilliseconds.toStopwatchStyle,
              ),
              if (savedStopwatch.bestLap > 0)
                _HistoryRow(label: 'Best lap:', value: savedStopwatch.bestLap.toStopwatchStyle),
              if (savedStopwatch.worstLap > 0)
                _HistoryRow(label: 'Worst lap:', value: savedStopwatch.worstLap.toStopwatchStyle),
            ],
          ),
        ),
      ),
    );
  }
}
