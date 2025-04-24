class UserModel {
  final String username;
  final String email;
  final List<String> interests;

  UserModel({
    required this.username,
    required this.email,
    required this.interests,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      interests: List<String>.from(json['interests'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'interests': interests,
    };
  }
}
