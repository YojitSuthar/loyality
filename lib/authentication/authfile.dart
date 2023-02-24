import 'package:assign_1/screens/home_page/home_screen.dart';
import 'package:assign_1/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:assign_1/screens/login_page/loginPage.dart';

class FireBase {
  Future singIn(TextEditingController emailController,
      TextEditingController passController) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((value) =>
            navigatorkey.currentState!.pushReplacementNamed(HomePage.id));
  }

  Future forgetPassword(TextEditingController email1) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email1.text.trim())
        .then((value) => navigatorkey.currentState!.pop(LoginPage.id));
  }
}
