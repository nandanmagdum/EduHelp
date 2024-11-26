class DonationCollection {
  String? donationId;
  String? donorId;
  String? requestId;
  int? amount;
  String? transactionId;
  String? paymentMethod;
  String? donationTimeStamp;

  DonationCollection(
      {this.donationId,
      this.donorId,
      this.requestId,
      this.amount,
      this.transactionId,
      this.paymentMethod,
      this.donationTimeStamp});

  DonationCollection.fromJson(Map<String, dynamic> json) {
    if (json["donationId"] is String) {
      donationId = json["donationId"];
    }
    if (json["donorId"] is String) {
      donorId = json["donorId"];
    }
    if (json["requestId"] is String) {
      requestId = json["requestId"];
    }
    if (json["amount"] is int) {
      amount = json["amount"];
    }
    if (json["transactionId"] is String) {
      transactionId = json["transactionId"];
    }
    if (json["paymentMethod"] is String) {
      paymentMethod = json["paymentMethod"];
    }
    if (json["donationTimeStamp"] is String) {
      donationTimeStamp = json["donationTimeStamp"];
    }
  }

  static List<DonationCollection> fromList(List<Map<String, dynamic>> list) {
    return list.map(DonationCollection.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["donationId"] = donationId;
    _data["donorId"] = donorId;
    _data["requestId"] = requestId;
    _data["amount"] = amount;
    _data["transactionId"] = transactionId;
    _data["paymentMethod"] = paymentMethod;
    _data["donationTimeStamp"] = donationTimeStamp;
    return _data;
  }
}
