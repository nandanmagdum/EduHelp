import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/constants/customTextStyles.dart';
import 'package:edu_help/controllers/crud.dart';
import 'package:edu_help/screens/auth/login_page.dart';
import 'package:edu_help/screens/auth/signin_page.dart';
import 'package:edu_help/screens/platform/donation_request_details_page.dart';
import 'package:edu_help/screens/platform/donation_request_page.dart';
import 'package:edu_help/widgets/custom_app_bar.dart';
import 'package:edu_help/widgets/custom_drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  final Size size;
  const HomePage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonationRequestPage(size: size),
            ),
          );
        },
        child: Text("Request"),
      ),
      appBar: customAppBar(),
      drawer: customDrawer(context: context),
      backgroundColor: Constants.color2,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            FutureBuilder(
              future: getAllDonations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error occured");
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final donationRequest = snapshot.data?[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DonationRequestDetailsPage(
                                  donationRequests: donationRequest,
                                ),
                              ));
                        },
                        leading: Text(
                          {index + 1}.toString(),
                          style: Customtextstyles.normalTextStyle,
                        ),
                        dense: true,
                        title: Text(
                          donationRequest!.title!,
                          style: Customtextstyles.normalTextStyle,
                        ),
                        subtitle: Text(
                          donationRequest.description!,
                          style: Customtextstyles.normalTextStyle,
                        ),
                        trailing: Text(
                          donationRequest.amountNeeded.toString(),
                          style: Customtextstyles.normalTextStyle,
                        ),
                      );
                    },
                  );
                } else {
                  return Text("Some thing went wrong!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
