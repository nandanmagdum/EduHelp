import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_help/constants/constants.dart';
import 'package:edu_help/models/user.dart';
import 'package:edu_help/screens/auth/signin_page.dart';
import 'package:edu_help/screens/platform/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  final Size size;
  SignUpPage({required this.size});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum SingingCharacter { student, donor }

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _bioController = TextEditingController();
  final _eduationController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.student;
  bool _isLoading = false;

  createUser() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password & confirm password doesn't match!")));
      return;
    }

    setState(() {
      _isLoading = true;
    }); // show indicator

    //* Authenticate user
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((value) async {
        print("User Created !");
        //* Save user details in users collection
        final newUser = new AppUser(
          fullName: _nameController.text,
          email: _emailController.text,
          address: _addressController.text,
          phoneNumber: _phoneNumberController.text,
          userId: value.user?.uid,
          role: _character?.name,
          education:
              _character?.name == "student" ? _eduationController.text : null,
          bio: _character?.name == "donor" ? _bioController.text : null,
          createdAt: FieldValue.serverTimestamp()
        );
        await FirebaseFirestore.instance
            .collection("users")
            .doc(value.user?.uid)
            .set(newUser.toJson());
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    size: widget.size,
                  )));
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
      return;
    }

    setState(() {
      _isLoading = false;
    }); // hide indicator
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          "EduHelp",
          style: TextStyle(color: Constants.textColor2),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: widget.size.height * 0.06),
              Text(
                "Sign Up",
                style: TextStyle(color: Constants.textColor2, fontSize: 20.sp),
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
                      SizedBox(height: widget.size.height * 0.02),
                      // name TextField
                      TextField(
                        controller: _nameController,
                        style: TextStyle(color: Constants.textColor2),
                        decoration: InputDecoration(
                          hintText: "Full Name",
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
                      // email Textfield
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                      // phone number Textfield
                      TextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Constants.textColor2),
                        decoration: InputDecoration(
                          hintText: "Phone Number",
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
                      // address Textfield
                      TextField(
                        maxLines: 2,
                        controller: _addressController,
                        style: TextStyle(color: Constants.textColor2),
                        decoration: InputDecoration(
                          focusColor: Constants.color4,
                          hintText: "Address",
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
                      // role selection
                      Column(
                        children: <Widget>[
                          Text(
                            "Select your role:",
                            style: TextStyle(
                              color: Constants.color6,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Student',
                              style: TextStyle(
                                color: Constants.color6,
                                fontSize: Constants.fontSize16,
                              ),
                            ),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.student,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Donor',
                              style: TextStyle(color: Constants.color6),
                            ),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.donor,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: widget.size.height * 0.02),
                      // Education TextField
                      if (_character?.name == "student")
                        TextField(
                          controller: _eduationController,
                          style: TextStyle(color: Constants.textColor2),
                          decoration: InputDecoration(
                            hintText: "Education",
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
                      if (_character?.name == "donor")
                        TextField(
                          controller: _bioController,
                          style: TextStyle(color: Constants.textColor2),
                          decoration: InputDecoration(
                            hintText: "Tell us about yourself",
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
                      // password Textfield
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

                      SizedBox(height: widget.size.height * 0.02),
                      // confirm password Textfield
                      TextField(
                        controller: _confirmPasswordController,
                        style: TextStyle(color: Constants.textColor2),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusColor: Constants.color4,
                          hintText: "Confirm Password",
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
                      SizedBox(height: widget.size.height * 0.04),
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
                                onPressed: () => createUser(),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: Constants.fontSize14,
                                      color: Constants.color1),
                                ),
                              ),
                      ),
                      SizedBox(height: widget.size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I'm a member! ",
                            style: TextStyle(
                                fontSize: Constants.fontSize14,
                                fontWeight: FontWeight.bold,
                                color: Constants.textColor3),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignInPage(size: widget.size))),
                            child: Text(
                              "Login now",
                              style: TextStyle(
                                  fontSize: Constants.fontSize14,
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
