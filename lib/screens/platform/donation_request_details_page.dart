import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/constants/customTextStyles.dart';
import 'package:edu_help/controllers/crud.dart';
import 'package:edu_help/models/donation_requests.dart';
import 'package:edu_help/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationRequestDetailsPage extends StatefulWidget {
  final DonationRequests donationRequests;
  const DonationRequestDetailsPage({super.key, required this.donationRequests});

  @override
  State<DonationRequestDetailsPage> createState() =>
      _DonationRequestDetailsPageState();
}

class _DonationRequestDetailsPageState
    extends State<DonationRequestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: Constants.color2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: FutureBuilder(
            future: getDonationRequestDetails(
                requestId: widget.donationRequests.requestId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Some error occured");
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Table(
                      border: TableBorder.all(color: Constants.color6),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                textAlign: TextAlign.center,
                                "Title",
                                style: Customtextstyles.normalTextStyle,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                textAlign: TextAlign.center,
                                snapshot.data?['title'],
                                style: Customtextstyles.normalTextStyle,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Text(
                                "Reuested By",
                                style: Customtextstyles.normalTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                snapshot.data?['fullName'],
                                style: Customtextstyles.normalTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Text("Some thing went wrong ");
            },
          ),
        ),
      ),
    );
  }
}
