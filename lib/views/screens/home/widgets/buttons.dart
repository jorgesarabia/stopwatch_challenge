part of '../home_screen.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Consumer<StopwatchController>(
      builder: (context, stopwatchController, child) {
        return Row(
          children: [
            if (!stopwatchController.isStopped)
              AppButton.lap(
                isEnabled: stopwatchController.isRuning,
                onTap: () {},
              ),
            if (stopwatchController.isZero)
              AppButton.start(onTap: () {
                stopwatchController.start();
              }),
            if (stopwatchController.isRuning)
              AppButton.stop(onTap: () {
                stopwatchController.stop();
              }),
            if (stopwatchController.isStopped) ...[
              AppButton.reset(onTap: () {
                stopwatchController.reset();
              }),
              AppButton.resume(onTap: () {
                stopwatchController.start();
              }),
            ],
          ],
        );
      },
    );
  }
}
