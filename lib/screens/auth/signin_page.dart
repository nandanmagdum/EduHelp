import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/screens/auth/forgot_pw_page.dart';
import 'package:edu_help/screens/auth/signup_page.dart';
import 'package:edu_help/screens/platform/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final Size size;

  SignInPage({required this.size});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  signin() async {
    setState(() {
      _isLoading = true;
    }); //* show indicator

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        // .trim() method removes any leading and trailing whitespace characters from a string
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(size: widget.size)));
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Provided email or pasword is not valid")));
    } finally {
      setState(() {
        _isLoading = false;
      }); //* hide indicator
    }
  }

  @override
  void dispose() {
    // For Memory management
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
          "Firebase",
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: widget.size.height * 0.085),
              Text(
                "Sign In",
                style: TextStyle(color: Constants.textColor2, fontSize: 40),
              ),
              SizedBox(height: widget.size.height * 0.04),
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
                      SizedBox(height: widget.size.height * 0.01),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Constants.textColor2),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusColor: Constants.color4,
                          hintText: "Password",
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
                      SizedBox(height: widget.size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordPage(size: widget.size))),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: widget.size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.textColor1),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: widget.size.height * 0.01),
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
                                onPressed: () => signin(),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: widget.size.width * 0.05,
                                      color: Constants.color1),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member? ",
                            style: TextStyle(
                                fontSize: widget.size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Constants.textColor3),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPage(size: widget.size))),
                            child: Text(
                              "Register now",
                              style: TextStyle(
                                  fontSize: widget.size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.textColor1),
                            ),
                          ),
                        ],
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
