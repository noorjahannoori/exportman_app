
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});

class ProfileState {
  final String name;
  final String email;
  final String phone;
  final bool darkMode;

  ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.darkMode,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    bool? darkMode,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(
          ProfileState(
            name: 'John Doe',
            email: 'info@codermaniaa.com',
            phone: '+1 234 567 890',
            darkMode: false,
          ),
        );

  void toggleDarkMode(bool value) {
    state = state.copyWith(darkMode: value);
  }

  void updateProfile(String name, String email, String phone) {
    state = state.copyWith(name: name, email: email, phone: phone);
  }

  Future<void> changePassword(String password) async {
    // 🔥 API call later
  }

  void logout() {
    // 🔥 clear token later
  }
}
