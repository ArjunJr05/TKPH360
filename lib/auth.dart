import 'package:Journix/auth_pages/login_page.dart';
import 'package:Journix/nav_pages/fashionsale.dart';
import 'package:Journix/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Google Sign-In aborted"),
        ));
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await auth.signInWithCredential(credential);
      User? userDetails = result.user;

      if (userDetails != null) {
        Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "name": userDetails.displayName,
          "imgUrl": userDetails.photoURL,
          "id": userDetails.uid,
        };
        await DatabaseMethods()
            .addUser(userDetails.uid, userInfoMap)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FashionSalePage()));
        });
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("FirebaseAuthException: ${e.message}"),
      ));
      print("FirebaseAuthException: ${e.code} - ${e.message}");
    } on PlatformException catch (e) {
      if (e.code == 'network_error') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Network error occurred. Please check your connection."),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("PlatformException: ${e.message}"),
        ));
      }
      print("PlatformException: ${e.code} - ${e.message}");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("An error occurred: $e"),
      ));
      print("General Exception: $e");
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error signing out: $e"),
      ));
      print("SignOut Error: $e");
    }
  }
}