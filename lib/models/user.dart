class User {
  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  String? role;

  User(
      {this.userId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.address,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
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
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["address"] = address;
    _data["role"] = role;
    return _data;
  }
}

