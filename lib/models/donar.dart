// class Donar {
//   String? donarId;
//   String? userId;
//   String? name;
//   String? email;
//   String? phone;
//   String? address;
//   bool? isAnonymous;

//   Donar({
//     this.donarId,
//     this.userId,
//     this.name,
//     this.email,
//     this.phone,
//     this.address,
//     this.isAnonymous,
//   });

//   Donar.fromJson(Map<String, dynamic> json) {
//     if (json["donarId"] is String) {
//       donarId = json["donarId"];
//     }
//     if (json["userId"] is String) {
//       userId = json["userId"];
//     }
//     if (json["name"] is String) {
//       name = json["name"];
//     }
//     if (json["email"] is String) {
//       email = json["email"];
//     }
//     if (json["phone"] is String) {
//       phone = json["phone"];
//     }
//     if (json["address"] is String) {
//       address = json["address"];
//     }
//     if (json["isAnonymous"] is bool) {
//       isAnonymous = json["isAnonymous"];
//     }
//   }

//   static List<Donar> fromList(List<Map<String, dynamic>> list) {
//     return list.map(Donar.fromJson).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["donarId"] = donarId;
//     _data["userId"] = userId;
//     _data["name"] = name;
//     _data["email"] = email;
//     _data["phone"] = phone;
//     _data["address"] = address;
//     _data["isAnonymous"] = isAnonymous;
//     return _data;
//   }
// }
