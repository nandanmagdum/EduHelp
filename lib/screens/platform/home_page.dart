import 'package:edu_help/screens/auth/login_page.dart';
import 'package:edu_help/screens/auth/signin_page.dart';
import 'package:edu_help/screens/platform/donation_request_page.dart';
import 'package:edu_help/widgets/custom_app_bar.dart';
import 'package:edu_help/widgets/custom_drawer.dart';
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
    );
  }
}
