import 'package:flutter/material.dart';
import '../theme/colors.dart';

class OnboardingDots extends StatelessWidget {
  final int count;
  final int index;

  const OnboardingDots({
    super.key,
    required this.count,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: index == i ? 20 : 6,
          decoration: BoxDecoration(
            color: index == i
                ? const Color(0xFFE6C394) // ✅ ACTIVE DOT COLOR
                : AppColors.main,        // ✅ NORMAL DOT COLOR
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
