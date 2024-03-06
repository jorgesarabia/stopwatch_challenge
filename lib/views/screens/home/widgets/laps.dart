part of '../home_screen.dart';

class _Laps extends StatelessWidget {
  const _Laps();

  @override
  Widget build(BuildContext context) {
    return Consumer<StopwatchController>(
      builder: (context, stopwatchController, child) {
        final stopwatchModel = stopwatchController.stopwatchModel;
        final laps = stopwatchModel.laps;

        if (laps.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: const [
                  TableRow(children: [
                    Text('Lap', textAlign: TextAlign.center),
                    Text('Lap times', textAlign: TextAlign.center),
                    Text('Overall time', textAlign: TextAlign.center),
                  ]),
                  TableRow(children: [Divider(), Divider(), Divider()]),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: List.generate(
                      laps.length,
                      (index) {
                        final lap = laps[index];
                        return TableRow(children: [
                          Text((index + 1).toString().padLeft(2, '0'), textAlign: TextAlign.center),
                          Text(lap.partialMilliseconds.toStopwatchStyle, textAlign: TextAlign.center),
                          Text(lap.totalMilliseconds.toStopwatchStyle, textAlign: TextAlign.center),
                        ]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
