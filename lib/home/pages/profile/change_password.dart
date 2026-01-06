import 'package:exportman/home/pages/profile/profile_provider.dart';
import 'package:exportman/widgets/app_resuable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/colors.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final pass = TextEditingController();
  final confirm = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Change Password',
          style: TextStyle(color: AppColors.white)
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your new password must be different from previous used password',
              style: theme.titleSmall?.copyWith(color: AppColors.bodyText),
            ),
            const SizedBox(height: 16),

            /// 🔐 New Password
            AppTextField(
              label: 'New Password',
              controller: pass,
              obscureText: !_isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// 🔐 Confirm Password
            AppTextField(
              label: 'Re-enter Password',
              controller: confirm,
              obscureText: !_isConfirmVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isConfirmVisible = !_isConfirmVisible;
                  });
                },
                child: Icon(
                  _isConfirmVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                  color: AppColors.black,
                ),
              ),
            ),

            const Spacer(),

            /// ✅ Confirm Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                ref.read(profileProvider.notifier).changePassword(pass.text);

                Navigator.pop(context);
              },
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
