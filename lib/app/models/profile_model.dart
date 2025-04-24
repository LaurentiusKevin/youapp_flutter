class ProfileModel {
  final String? name;
  final String? gender;
  final String? birthday;
  final int? height;
  final int? weight;
  final List<String>? interests;

  ProfileModel({
    this.name,
    this.gender,
    this.birthday,
    this.height,
    this.weight,
    this.interests,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      gender: json['gender'],
      birthday: json['birthday'],
      height: json['height'],
      weight: json['weight'],
      interests: List<String>.from(json['interests'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'birthday': birthday,
      'height': height,
      'weight': weight,
      'interests': interests,
    };
  }

  ProfileModel copyWith({
    String? name,
    String? gender,
    String? birthday,
    int? height,
    int? weight,
    List<String>? interests,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      interests: interests ?? this.interests,
    );
  }
}
