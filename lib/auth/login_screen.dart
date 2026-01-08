import 'package:exportman/auth/sign_up_screeen.dart';
import 'package:exportman/view/home_screen.dart';
import 'package:exportman/theme/colors.dart';
import 'package:exportman/widgets/app_resuable_textfield.dart';
import 'package:exportman/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),

            const AuthHeader(
              title: 'Hello Sara!',
              subtitle: 'Welcome Back, You Have Been Missed For Long Time',
            ),

            const SizedBox(height: 40),

            /// EMAIL
            AppTextField(
              label: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              suffixIcon: const Icon(Icons.email_outlined, size: 18),
            ),

            const SizedBox(height: 16),

            /// PASSWORD
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
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// REMEMBER + FORGOT
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  activeColor: AppColors.primary, // ✅ checked color
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),

                Text(
                  'Remember Me',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
                ),

                const Spacer(),

                Text(
                  'Forgot Password?',
                  style: GoogleFonts.workSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            /// LOGIN BUTTON
            AppButton(
              text: 'Login',
              textColor: AppColors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),

            const SizedBox(height: 16),

            /// SIGN UP TEXT
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// DIVIDER
            Row(
              children: [
                Expanded(
                  child: Container(height: 1.5, color: Color(0xFFEBEBEB)),
                ),
                const SizedBox(width: 12),
                Text(
                  'Or Continue With',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(height: 1.5, color: Color(0xFFEBEBEB)),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// SOCIAL
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.background,
                  child: Image.asset('assets/images/google.png', width: 18),
                ),
                const SizedBox(width: 16),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.background,
                  child: Icon(Icons.phone, size: 18, color: AppColors.primary),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
