import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  factory AppButton.start({required VoidCallback onTap}) {
    return AppButton._(
      label: 'Start',
      onTap: onTap,
      textColor: Colors.white,
      backgroundColor: Colors.blueGrey,
    );
  }

  factory AppButton.lap({required bool isEnabled, required VoidCallback onTap}) {
    return AppButton._(
      label: 'Lap',
      onTap: isEnabled ? onTap : null,
      textColor: isEnabled ? Colors.black : Colors.grey,
      backgroundColor: Colors.grey.withOpacity(isEnabled ? 1 : 0.5),
    );
  }

  factory AppButton.stop({required VoidCallback onTap}) {
    return AppButton._(
      label: 'Stop',
      onTap: onTap,
      textColor: Colors.white,
      backgroundColor: Colors.red,
    );
  }

  factory AppButton.resume({required VoidCallback onTap}) {
    return AppButton._(
      label: 'Resume',
      onTap: onTap,
      textColor: Colors.white,
      backgroundColor: Colors.blueGrey,
    );
  }

  factory AppButton.reset({required VoidCallback onTap}) {
    return AppButton._(
      label: 'Reset',
      onTap: onTap,
      textColor: Colors.black,
      backgroundColor: Colors.grey,
    );
  }

  final VoidCallback? onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.w),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20.sp,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
