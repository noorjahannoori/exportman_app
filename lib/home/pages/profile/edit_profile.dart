import 'package:exportman/home/pages/profile/profile_provider.dart';
import 'package:exportman/widgets/app_resuable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/colors.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final name = TextEditingController(text: profile.name);
    final email = TextEditingController(text: profile.email);
    final phone = TextEditingController(text: profile.phone);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(
              label: 'Full Name',
              suffixIcon: const Icon(Icons.person, size: 18),
              controller: name,
            ),
            const SizedBox(height: 12),
            AppTextField(
              label: 'Email',
              suffixIcon: const Icon(Icons.email_outlined, size: 18),
              controller: email,
            ),
            const SizedBox(height: 12),
            AppTextField(
              label: 'Contact Number',
              suffixIcon: const Icon(Icons.phone, size: 18),
              controller: phone,
            ),
            AppTextField(
              label: 'Location',
              suffixIcon: const Icon(Icons.location_pin, size: 18),
              controller: phone,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                ref
                    .read(profileProvider.notifier)
                    .updateProfile(name.text, email.text, phone.text);
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
