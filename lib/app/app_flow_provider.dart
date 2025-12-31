import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppFlow {
  splash,
  onboarding,
  login,
  signup,
  home,
}

final appFlowProvider =
    StateNotifierProvider<AppFlowNotifier, AppFlow>(
  (ref) => AppFlowNotifier(),
);

class AppFlowNotifier extends StateNotifier<AppFlow> {
  AppFlowNotifier() : super(AppFlow.splash);

  void finishSplash() => state = AppFlow.onboarding;
  void finishOnboarding() => state = AppFlow.login;
  void goToSignup() => state = AppFlow.signup;
  void loginSuccess() => state = AppFlow.home;
}
