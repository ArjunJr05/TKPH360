// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, unnecessary_new

import 'package:Journix/auth_pages/sign_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password Reset Email has been sent!",
        style: TextStyle(fontSize: 20.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that email.",
          style: TextStyle(fontSize: 20.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Password Recovery',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: mailcontroller,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Metropolis'),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf),
                                  fontSize: 18.0,
                                  fontFamily: 'Metropolis')),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                            });
                            resetPassword();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width ,
                          padding: EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "Send Email",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Metropolis',
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                          color: Color(0xFF8c8e98),
                          fontSize: 18.0,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500)),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Create",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18.0,
                            fontFamily: 'Metropolis',
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
