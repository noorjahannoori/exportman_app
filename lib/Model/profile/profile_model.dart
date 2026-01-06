class ProfileModel {
  final String name;
  final String email;
  final String image;
  final bool isDarkMode;

  ProfileModel({
    required this.name,
    required this.email,
    required this.image,
    required this.isDarkMode,
  });

  // 🔹 API ke liye ready
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      isDarkMode: json['isDarkMode'] ?? false,
    );
  }

  ProfileModel copyWith({
    String? name,
    String? email,
    String? image,
    bool? isDarkMode,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
