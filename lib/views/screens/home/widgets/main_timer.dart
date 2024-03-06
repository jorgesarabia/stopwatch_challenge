part of '../home_screen.dart';

class _MainTimer extends StatelessWidget {
  const _MainTimer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: StreamProvider<int>(
        create: (context) => context.read<StopwatchController>().timerStream,
        initialData: 0,
        child: Consumer<int>(
          builder: (context, milliseconds, child) {
            final stopwatchController = context.read<StopwatchController>();

            return Column(
              children: [
                Text(
                  milliseconds.toStopwatchStyle,
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (stopwatchController.stopwatchModel.laps.isNotEmpty)
                  Text(
                    (milliseconds - stopwatchController.stopwatchModel.mainTimer.totalMilliseconds).toStopwatchStyle,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
