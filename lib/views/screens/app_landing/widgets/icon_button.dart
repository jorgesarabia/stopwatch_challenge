part of '../app_landing_screen.dart';

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.onPressed,
    required this.isSelected,
    required this.label,
  });

  final IconData icon;
  final void Function() onPressed;
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            size: isSelected ? 30.w : 25.w,
            color: isSelected ? Colors.blueGrey : Colors.grey,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: isSelected ? 13.sp : 10.sp,
            color: isSelected ? Colors.blueGrey : Colors.grey,
          ),
        )
      ],
    );
  }
}
