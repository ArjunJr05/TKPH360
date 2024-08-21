import 'package:Journix/auth_pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Journix/nav_pages/fashionsale.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // User is signed in, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FashionSalePage()),
      );
    } else {
      // No user is signed in, navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          width: screenWidth * 0.6, 
          height: screenHeight * 0.6, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
