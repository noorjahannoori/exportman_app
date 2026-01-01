import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,  bool,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 58,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          filled: true,
          fillColor: AppColors.background, // #F6F7F9
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 18,
            minWidth: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
