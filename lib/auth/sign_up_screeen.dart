import 'package:exportman/theme/colors.dart';
import 'package:exportman/widgets/app_resuable_textfield.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_button.dart';
import '../../widgets/auth_header.dart';
import '../view/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              /// 🔵 TOP CIRCLE ICON
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primary,
                child: const Icon(
                  Icons.person_outline,
                  size: 36,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 16),

              const AuthHeader(
                title: 'Hello User!',
                subtitle: 'Signup For Better Experience',
              ),

              const SizedBox(height: 40),

              /// 🔹 FULL NAME
              const AppTextField(
                label: 'Full Name',
                keyboardType: TextInputType.name,
                suffixIcon: Icon(Icons.person_outline, size: 18),
              ),

              const SizedBox(height: 16),

              /// 🔹 USER NAME
              const AppTextField(
                label: 'User Name',
                keyboardType: TextInputType.name,
                suffixIcon: Icon(Icons.person_outline, size: 18),
              ),

              const SizedBox(height: 16),

              /// 🔹 EMAIL
              const AppTextField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icon(Icons.email_outlined, size: 18),
              ),

              const SizedBox(height: 16),

              /// 🔹 PASSWORD (TOGGLE)
              AppTextField(
                label: 'Password',
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
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 CONTACT NUMBER
              const AppTextField(
                label: 'Contact Number',
                keyboardType: TextInputType.phone,
                suffixIcon: Icon(Icons.phone_outlined, size: 18),
              ),

              const SizedBox(height: 32),

              /// 🔘 SIGN UP BUTTON
              AppButton(
                text: 'SIGN UP',
                textColor: AppColors.white,
                // ✅ WHITE TEXT
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),

              const SizedBox(height: 16),

              /// 🔗 SIGN IN LINK
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
