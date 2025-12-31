import 'package:exportman/auth/login_screen.dart';
import 'package:exportman/auth/sign_up_screeen.dart';
import 'package:exportman/home/home_screen.dart';
import 'package:exportman/splesh/onboradingscreen/onboarding_screen.dart';
import 'package:exportman/splesh/splesh_white.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_flow_provider.dart';

class AppEntry extends ConsumerWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow = ref.watch(appFlowProvider);

    switch (flow) {
      case AppFlow.splash:
        return const SplashScreen();
      case AppFlow.onboarding:
        return const OnboardingScreen();
      case AppFlow.login:
        return const LoginScreen();
      case AppFlow.signup:
        return const SignupScreen();
      case AppFlow.home:
        return const HomeScreen();
    }
  }
}
