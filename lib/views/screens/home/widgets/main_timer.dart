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
            final seconds = (milliseconds / 1000).truncate();
            final minutes = (seconds / 60).truncate();
            final remainingSeconds = seconds % 60;
            final remainingMilliseconds = ((milliseconds % 1000) / 10).truncate();

            final buffer = StringBuffer(minutes.toString().padLeft(2, '0'));
            buffer.write(':');
            buffer.write(remainingSeconds.toString().padLeft(2, '0'));
            buffer.write('.');
            buffer.write(remainingMilliseconds.toString().padLeft(2, '0'));

            return Text(
              buffer.toString(),
              style: TextStyle(
                fontSize: 35.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
    );
  }
}
