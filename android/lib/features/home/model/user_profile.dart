class UserProfile {
  String id;
  String name;
  String email;
  String about;
  String phone;
  String createdAt;
  String lastActivated;
  String pushToken;
  bool online;

  UserProfile({
  required this.id,
  required this.name,
  required this.email,
  required this.about,
  required this.phone,
  required this.createdAt,
  required this.lastActivated,
  required this.pushToken,
  required this.online,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
  return UserProfile(
  id: json['id'] ?? '',
  name: json['name'] ?? '',
  email: json['email'] ?? '',
  about: json['about'] ?? '',
  phone: json['phone_number'] ?? '',
  createdAt: json['created_at'] ?? '',
  lastActivated: json['last_activated'] ?? '',
  pushToken: json['push_token'] ?? '',
  online: json['online'] ?? false,
  );
  }

  Map<String, dynamic> toJson() {
  return {
  'id': id,
  'name': name,
  'email': email,
  'about': about,
  'phone_number': phone,
  'created_at': createdAt,
  'last_activated': lastActivated,
  'push_token': pushToken,
  'online': online,
  };
  }

}