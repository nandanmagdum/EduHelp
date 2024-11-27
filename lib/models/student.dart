// class Student {
//   String? studentId;
//   String? userId;
//   String? education;
//   String? bio;
//   String? reasonForHelp;
//   int? totalFundsRecieved;

//   Student(
//       {this.studentId,
//       this.userId,
//       this.education,
//       this.bio,
//       this.reasonForHelp,
//       this.totalFundsRecieved});

//   Student.fromJson(Map<String, dynamic> json) {
//     if (json["studentId"] is String) {
//       studentId = json["studentId"];
//     }
//     if (json["userId"] is String) {
//       userId = json["userId"];
//     }
//     if (json["education"] is String) {
//       education = json["education"];
//     }
//     if (json["bio"] is String) {
//       bio = json["bio"];
//     }
//     if (json["reasonForHelp"] is String) {
//       reasonForHelp = json["reasonForHelp"];
//     }
//     if (json["totalFundsRecieved"] is int) {
//       totalFundsRecieved = json["totalFundsRecieved"];
//     }
//   }

//   static List<Student> fromList(List<Map<String, dynamic>> list) {
//     return list.map(Student.fromJson).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["studentId"] = studentId;
//     _data["userId"] = userId;
//     _data["education"] = education;
//     _data["bio"] = bio;
//     _data["reasonForHelp"] = reasonForHelp;
//     _data["totalFundsRecieved"] = totalFundsRecieved;
//     return _data;
//   }
// }
