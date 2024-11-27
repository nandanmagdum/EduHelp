class AppUser {
  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  String? role;
  String? education;
  String? bio;
  dynamic createdAt;

  AppUser({
    this.userId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.role,
    this.education,
    this.bio,
    this.createdAt,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["fullName"] is String) {
      fullName = json["fullName"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    if (json["education"] is String) {
      education = json["education"];
    }
    if (json["bio"] is String) {
      bio = json["bio"];
    }
    if (json["createdAt"] != null) {
      createdAt = json["createdAt"];
    }
  }

  static List<AppUser> fromList(List<Map<String, dynamic>> list) {
    return list.map(AppUser.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["address"] = address;
    _data["role"] = role;
    _data["education"] = education;
    _data["bio"] = bio;
    _data["createdAt"] = createdAt;
    return _data;
  }
}
