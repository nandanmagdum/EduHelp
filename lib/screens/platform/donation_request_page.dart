import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/models/donation_requests.dart';
import 'package:edu_help/screens/auth/login_page.dart';
import 'package:edu_help/widgets/custom_app_bar.dart';
import 'package:edu_help/widgets/custom_snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationRequestPage extends StatefulWidget {
  final Size size;
  const DonationRequestPage({super.key, required this.size});

  @override
  State<DonationRequestPage> createState() => _DonationRequestPageState();
}

class _DonationRequestPageState extends State<DonationRequestPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _amountNeededController = TextEditingController();
  TextEditingController _paymentDetailsController = TextEditingController();
  bool _isLoading = false;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  createDonationRequest() async {
    final Size size = MediaQuery.of(context).size;
    try {
      _isLoading = true;
      setState(() {});
      if (firebaseAuth.currentUser == null) {
        showSnakBar(context, "Please Login", 2, false);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(size: size),
            ));
        _isLoading = false;
        setState(() {});
        return;
      }

      DonationRequests request = DonationRequests(
        requestId: firebaseFirestore.collection('donation_requests').doc().id,
        userId: firebaseAuth.currentUser?.uid,
        title: _titleController.text,
        description: _descriptionController.text,
        reason: _reasonController.text,
        amountNeeded: int.parse(_amountNeededController.text),
        amountRecieved: 0,
        status: "open",
        paymentDetails: _paymentDetailsController.text,
        createdAt: FieldValue.serverTimestamp(),
      );
      await firebaseFirestore
          .collection('donation_requests')
          .doc(request.requestId)
          .set(request.toJson());
      showSnakBar(context, "Request Created!", 3, true);
      _isLoading = false;
      setState(() {});
    } catch (e) {
      showSnakBar(context, e.toString(), 2, false);
      _isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: Constants.color2,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.06,
            vertical: widget.size.height * 0.03,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Request a Donation",
                  style: TextStyle(
                    color: Constants.color6,
                    fontSize: Constants.fontSize24,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // title textfield
              TextField(
                controller: _titleController,
                style: TextStyle(color: Constants.textColor2),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Constants.textColor3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.textColor3),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.color5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // description textfield
              TextField(
                controller: _descriptionController,
                style: TextStyle(color: Constants.textColor2),
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Constants.textColor3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.textColor3),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.color5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // amount textfield
              TextField(
                controller: _amountNeededController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Constants.textColor2),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "Amount Needed",
                  hintStyle: TextStyle(color: Constants.textColor3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.textColor3),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.color5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // reason textfield
              TextField(
                controller: _reasonController,
                style: TextStyle(color: Constants.textColor2),
                decoration: InputDecoration(
                  hintText: "Reason",
                  hintStyle: TextStyle(color: Constants.textColor3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.textColor3),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.color5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              // payment details textfield
              TextField(
                controller: _paymentDetailsController,
                style: TextStyle(color: Constants.textColor2),
                decoration: InputDecoration(
                  hintText: "Add UPI ID",
                  hintStyle: TextStyle(color: Constants.textColor3),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.textColor3),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.color5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity,
                height: widget.size.height * 0.06,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.textColor1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await createDonationRequest();
                        },
                        child: Text(
                          "Raise Request",
                          style: TextStyle(
                              fontSize: Constants.fontSize14,
                              color: Constants.color1),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
