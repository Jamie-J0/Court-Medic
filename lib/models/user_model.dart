class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl = '',
    this.token = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      token: json['token'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'token': token,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      token: token ?? this.token,
    );
  }
}
