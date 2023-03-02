import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resoureces.dart';
import '../resources/route_manager.dart';


class FireBase {
  Future singIn(TextEditingController emailController,
      TextEditingController passController) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((value) =>
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(HomePage.id));
  }

  Future forgetPassword(TextEditingController email1) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email1.text.trim())
        .then((value) => NavigationService.navigatorKey.currentState!.pop(LoginPage.id));
  }

  void SignOut() async{
    FirebaseAuth.instance.signOut().then((value) {
      NavigationService.navigatorKey.currentState!.pushReplacementNamed(LoginPage.id);
    });
  }


}
