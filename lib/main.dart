import 'package:edu_help/firebase_options.dart';
import 'package:edu_help/screens/auth/login_page.dart';
import 'package:edu_help/screens/auth/signin_page.dart';
import 'package:edu_help/screens/platform/donation_request_page.dart';
import 'package:edu_help/screens/platform/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    print("Firebase initilized !");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(400, 720),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return HomePage(
                size: size,
              );
            } else {
              return SignInPage(
                size: size,
              );
            }
          },
        ),
      ),
    );
  }
}
