extension TimeFormatterExtension on int {
  String get toStopwatchStyle {
    final milliseconds = this;
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();
    final remainingSeconds = seconds % 60;
    final remainingMilliseconds = ((milliseconds % 1000) / 10).truncate();

    final buffer = StringBuffer(minutes.toString().padLeft(2, '0'));
    buffer.write(':');
    buffer.write(remainingSeconds.toString().padLeft(2, '0'));
    buffer.write('.');
    buffer.write(remainingMilliseconds.toString().padLeft(2, '0'));

    return buffer.toString();
  }
}
