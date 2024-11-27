import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/models/donation_requests.dart';
import 'package:firebase_core/firebase_core.dart';

Future<List<DonationRequests>> getAllDonations() async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final requestsList =
      await firebaseFirestore.collection(Constants.donation_requests).get();
  final listData = requestsList.docs;
  List<DonationRequests> donationRequests = [];
  for (final request in listData) {
    donationRequests.add(DonationRequests.fromJson(request.data()));
  }
  return donationRequests;
}

Future<Map<String, dynamic>> getDonationRequestDetails(
    {required String requestId}) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Map<String, dynamic> data = {};
  final donation_request = await firebaseFirestore
      .collection(Constants.donation_requests)
      .doc(requestId)
      .get();
  final donation_request_data = donation_request.data();
  data.addAll(donation_request_data!);
  final requesterId = await donation_request_data['studentId'];
  final requester = await firebaseFirestore
      .collection(Constants.users)
      .doc(requesterId)
      .get();
  final requester_data = await requester.data();
  data.addAll(requester_data!);
  return data;
}
