part of '../history_screen.dart';

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label.padRight(15),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
