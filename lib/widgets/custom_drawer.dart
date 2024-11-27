import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/screens/auth/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customDrawer({required BuildContext context}) {
  final Size size = MediaQuery.of(context).size;
  return Drawer(
    backgroundColor: Constants.color1,
    child: Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(size: size),
                ));
          },
          child: Text("Logout"),
        ),
      ],
    ),
  );
}
