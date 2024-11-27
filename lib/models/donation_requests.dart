class DonationRequests {
  String? requestId;
  String? userId;
  String? title;
  String? description;
  String? reason;
  int? amountNeeded;
  int? amountRecieved;
  String? status;
  String? paymentDetails;
  dynamic createdAt;

  DonationRequests({
    this.requestId,
    this.userId,
    this.title,
    this.description,
    this.reason,
    this.amountNeeded,
    this.amountRecieved,
    this.status,
    this.paymentDetails,
    this.createdAt,
  });

  DonationRequests.fromJson(Map<String, dynamic> json) {
    if (json["requestId"] is String) {
      requestId = json["requestId"];
    }
    if (json["studentId"] is String) {
      userId = json["studentId"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["reason"] is String) {
      reason = json["reason"];
    }
    if (json["amountNeeded"] is int) {
      amountNeeded = json["amountNeeded"];
    }
    if (json["amountRecieved"] is int) {
      amountRecieved = json["amountRecieved"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["paymentDetails"] is String) {
      paymentDetails = json["paymentDetails"];
    }
    createdAt = json["createdAt"];
  }

  static List<DonationRequests> fromList(List<Map<String, dynamic>> list) {
    return list.map(DonationRequests.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["requestId"] = requestId;
    _data["studentId"] = userId;
    _data["title"] = title;
    _data["description"] = description;
    _data["reason"] = reason;
    _data["amountNeeded"] = amountNeeded;
    _data["amountRecieved"] = amountRecieved;
    _data["status"] = status;
    _data["paymentDetails"] = paymentDetails;
    _data["createdAt"] = createdAt;
    return _data;
  }
}
