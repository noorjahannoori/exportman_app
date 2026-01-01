import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
