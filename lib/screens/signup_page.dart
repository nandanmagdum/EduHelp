// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/auth/signin_page.dart';
// import 'package:flutter_firebase/constants.dart';
// import 'package:flutter_firebase/home_page.dart';

// class SignUpPage extends StatefulWidget {
//   final Size size;
//   SignUpPage({required this.size});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   bool _isLoading = false;

//   createUser() async {
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Password & confirm password doesn't match!")));
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     }); // show indicator

//     //* Authenticate user
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim());
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => HomePage(
//                     size: widget.size,
//                   )));
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.message!)));
//       return;
//     }

//     //* Save user details in users collection
//     await FirebaseFirestore.instance.collection("users").add({
//       "name": _nameController.text,
//       "age": _ageController.text,
//     });

//     setState(() {
//       _isLoading = false;
//     }); // hide indicator
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   //* ^-^ Variables and function ^-^ *//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Constants.color2,
//       appBar: AppBar(
//         backgroundColor: Constants.color1,
//         centerTitle: true,
//         title: Text(
//           "Firebase",
//           style: TextStyle(color: Constants.textColor2),
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.06),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: widget.size.height * 0.06),
//               Text(
//                 "Sign Up",
//                 style: TextStyle(color: Constants.textColor2, fontSize: 40),
//               ),
//               SizedBox(height: widget.size.height * 0.04),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(),
//                     color: Constants.color1,
//                     boxShadow: [
//                       BoxShadow(
//                           blurRadius: 5,
//                           offset: Offset(2, 2),
//                           spreadRadius: 0.1,
//                           color: Constants.color3)
//                     ]),
//                 child: Padding(
//                   padding: EdgeInsets.all(widget.size.width * 0.06),
//                   child: Column(
//                     children: [
//                       SizedBox(height: widget.size.height * 0.02),
//                       // name TextField
//                       TextField(
//                         controller: _nameController,
//                         style: TextStyle(color: Constants.textColor2),
//                         decoration: InputDecoration(
//                           hintText: "Name",
//                           hintStyle: TextStyle(color: Constants.textColor3),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Constants.textColor3),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Constants.color5),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.02),
//                       // age Textfield
//                       TextField(
//                         controller: _ageController,
//                         keyboardType: TextInputType.number,
//                         style: TextStyle(color: Constants.textColor2),
//                         decoration: InputDecoration(
//                           hintText: "Age",
//                           hintStyle: TextStyle(color: Constants.textColor3),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Constants.textColor3),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Constants.color5),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.02),
//                       // email Textfield
//                       TextField(
//                         controller: _emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         style: TextStyle(color: Constants.textColor2),
//                         decoration: InputDecoration(
//                           hintText: "Email",
//                           hintStyle: TextStyle(color: Constants.textColor3),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Constants.textColor3),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Constants.color5),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.02),
//                       // password Textfield
//                       TextField(
//                         controller: _passwordController,
//                         style: TextStyle(color: Constants.textColor2),
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           focusColor: Constants.color4,
//                           hintText: "Password",
//                           hintStyle: TextStyle(color: Constants.textColor3),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Constants.textColor3),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Constants.color5),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.02),
//                       // confirm password Textfield
//                       TextField(
//                         controller: _confirmPasswordController,
//                         style: TextStyle(color: Constants.textColor2),
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           focusColor: Constants.color4,
//                           hintText: "Confirm Password",
//                           hintStyle: TextStyle(color: Constants.textColor3),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Constants.textColor3),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Constants.color5),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.04),
//                       SizedBox(
//                         width: double.infinity,
//                         height: widget.size.height * 0.06,
//                         child: _isLoading
//                             ? Center(child: CircularProgressIndicator())
//                             : ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Constants.textColor1,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () => createUser(),
//                                 child: Text(
//                                   "Sign Up",
//                                   style: TextStyle(
//                                       fontSize: widget.size.width * 0.05,
//                                       color: Constants.color1),
//                                 ),
//                               ),
//                       ),
//                       SizedBox(height: widget.size.height * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "I'm a member! ",
//                             style: TextStyle(
//                                 fontSize: widget.size.width * 0.04,
//                                 fontWeight: FontWeight.bold,
//                                 color: Constants.textColor3),
//                           ),
//                           GestureDetector(
//                             onTap: () => Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         SignInPage(size: widget.size))),
//                             child: Text(
//                               "Login now",
//                               style: TextStyle(
//                                   fontSize: widget.size.width * 0.04,
//                                   fontWeight: FontWeight.bold,
//                                   color: Constants.textColor1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
