import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/utils/extensions/date_formatter_extension.dart';
import 'package:stopwatch_challenge/utils/extensions/time_formatter_extension.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';

part 'widgets/history_card.dart';
part 'widgets/history_row.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              onTap: () async {
                await context.read<StopwatchController>().deleteHistory();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2.w),
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
                child: const Text(
                  'Delete all',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SavedStopwatch>>(
        future: context.read<StopwatchController>().getSavedStopwatches(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final dataList = snapshot.data!;

            if (dataList.isEmpty) return const Center(child: Text('No records saved'));

            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final savedStopwatch = dataList[index];

                return GestureDetector(
                  onTap: () => context.read<StopwatchController>().loadSavedStopwatch(savedStopwatch),
                  child: _HistoryCard(savedStopwatch: savedStopwatch),
                );
              },
            );
          }
        },
      ),
    );
  }
}
