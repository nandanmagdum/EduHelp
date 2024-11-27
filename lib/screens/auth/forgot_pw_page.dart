import 'package:edu_help/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  final Size size;

  ForgotPasswordPage({required this.size});

  @override
  State<ForgotPasswordPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  //* ^-^ Variables and function ^-^ *//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.color2,
      appBar: AppBar(
        backgroundColor: Constants.color1,
        centerTitle: true,
        title: Text(
          "EduHelp",
          style: TextStyle(color: Constants.textColor2),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.06,
            vertical: widget.size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: widget.size.height * 0.085),
              Text(
                "Enter your Email and we will send you the password reset link",
                style: TextStyle(color: Constants.textColor2, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: widget.size.height * 0.02),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                    color: Constants.color1,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(2, 2),
                          spreadRadius: 0.1,
                          color: Constants.color3)
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(widget.size.width * 0.06),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailController,
                        style: TextStyle(color: Constants.textColor2),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Constants.textColor3),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Constants.textColor3),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.color5),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: widget.size.height * 0.02),
                      SizedBox(
                        width: double.infinity,
                        height: widget.size.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.textColor1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => () async {
                            await resetPassword();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: Constants.fontSize14,
                              color: Constants.color1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
