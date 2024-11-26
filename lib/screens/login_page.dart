// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/auth/signin_page.dart';
// import 'package:flutter_firebase/auth/signup_page.dart';
// import 'package:flutter_firebase/constants.dart';

// class LoginPage extends StatefulWidget {
//   final Size size;
//   LoginPage({super.key, required this.size});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Constants.color2,
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: widget.size.width * 0.08,
//             vertical: widget.size.height * 0.03),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(height: widget.size.height * 0.2),
//                 Image.asset(
//                   "assets/firebase.png",
//                   scale: widget.size.width * 0.03,
//                 ),
//                 SizedBox(height: widget.size.height * 0.08),
//                 SizedBox(
//                   width: double.infinity,
//                   height: widget.size.height * 0.06,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Constants.textColor1,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   SignInPage(size: widget.size)));
//                     },
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                           fontSize: widget.size.width * 0.05,
//                           color: Constants.color1),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: widget.size.height * 0.02),
//                 SizedBox(
//                   width: double.infinity,
//                   height: widget.size.height * 0.06,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Constants.textColor1,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   SignUpPage(size: widget.size)));
//                     },
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                           fontSize: widget.size.width * 0.05,
//                           color: Constants.color1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
