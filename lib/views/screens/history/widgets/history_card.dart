part of '../history_screen.dart';

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.savedStopwatch});

  final SavedStopwatch savedStopwatch;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(savedStopwatch.savedAt.toString()),
        ],
      ),
    );
  }
}
