part of '../home_screen.dart';

class _MainTimer extends StatelessWidget {
  const _MainTimer();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (context) => context.read<StopwatchController>().timerStream,
      initialData: 0,
      child: Consumer<int>(
        builder: (context, milliseconds, child) {
          int seconds = milliseconds ~/ 1000;
          int minutes = seconds ~/ 60;
          seconds %= 60;

          String formattedTime =
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(milliseconds ~/ 10).toString().padLeft(2, '0')}';

          return Text(formattedTime);
        },
      ),
    );
  }
}
