import 'package:flutter/material.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

part 'widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _HistoryCard(
          savedStopwatch: SavedStopwatch(),
        );
      },
    );
  }
}
