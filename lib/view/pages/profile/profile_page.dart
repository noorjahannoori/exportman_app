import 'package:exportman/view/pages/profile/change_password.dart';
import 'package:exportman/view/pages/profile/edit_profile.dart';
import 'package:exportman/view/pages/profile/profile_provider.dart';
import 'package:exportman/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,

      /// 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: theme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 PROFILE IMAGE
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(Icons.person, size: 50),
                ),

                /// 🔹 EDIT ICON
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfilePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            /// 🔹 NAME
            const SizedBox(height: 12),
            Text(profile.name, style: theme.bodyMedium),

            /// 🔹 EMAIL
            const SizedBox(height: 4),
            Text(
              profile.email,
              style: theme.titleSmall?.copyWith(color: AppColors.bodyText),
            ),

            const SizedBox(height: 24),

            /// 🔹 GENERAL
            sectionTitle('GENERAL', theme),

            settingTile(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              trailing: Switch(
                value: profile.darkMode,
                activeColor: Colors.white,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: AppColors.primary,
                inactiveTrackColor: AppColors.white,

                onChanged: (v) =>
                    ref.read(profileProvider.notifier).toggleDarkMode(v),
              ),
            ),

            settingTile(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
                );
              },
            ),
            settingTile(
              icon: Icons.language,
              title: 'App Language',
              onTap: () {},
            ),
            settingTile(icon: Icons.favorite, title: 'Favorite', onTap: () {}),
            settingTile(icon: Icons.star, title: 'Rate Us', onTap: () {}),
            const SizedBox(height: 16),

            /// 🔹 ABOUT APP
            sectionTitle('ABOUT APP', theme),

            settingTile(
              icon: Icons.privacy_tip,
              showArrow: false,
              title: 'Privacy Policy',
            ),
            settingTile(
              icon: Icons.edit_document,
              showArrow: false,
              title: 'Term and Condition',
            ),

            settingTile(
              icon: Icons.help,
              title: 'Help Support',
              showArrow: false,
            ),

            const SizedBox(height: 30),

            /// 🔹 LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  _showLogoutDialog(context, ref);
                },
                child: Text(
                  'Logout',
                  style: theme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  /// 🔹 Widgets
  Widget sectionTitle(String text, TextTheme theme) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        text,
        style: theme.labelSmall?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    bool showArrow = true,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(color: AppColors.black)),
      trailing:
          trailing ??
          (showArrow ? const Icon(Icons.arrow_forward_ios, size: 16) : null),
      onTap: onTap,
    );
  }
}

void _showLogoutDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: const Color(0xCC000000), // 🔹 dim background
    builder: (context) {
      return Center(
        child: Container(
          width: 342,
          height: 470.5,
          padding: const EdgeInsets.fromLTRB(24, 56, 24, 56),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 🖼 IMAGE
              Image.asset(
                'assets/images/logout.png',
                width: 275,
                height: 170,
                fit: BoxFit.contain,
              ),

              /// 📝 TEXT
              Column(
                children: const [
                  Text(
                    'Oh No, You are leaving us!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Are you sure you want to logout?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),

              /// 🔘 BUTTONS ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 137,
                    height: 51,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 137,
                    height: 51,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        ref.read(profileProvider.notifier).logout();

                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   '/login',
                        //   (route) => false,
                        // );
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
