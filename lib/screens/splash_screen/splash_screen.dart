import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/resources/resources.dart';
import '../home_page/homePage.dart';
import '../login_page/loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateLogin();
  }

  void navigateLogin() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(time, () {});
    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return const HomePage();
        },
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return const LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        transitionOnUserGestures: true,
        tag: "name",
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                GradientColorManager.g1Color,
                GradientColorManager.g2Color
              ])),
          child: Center(
              child: Text(
            "Zignuts Technolab",
            style:
                getTextStyle(33.sp, "Orbitron", GradientColorManager.g3Color),
          )),
        ),
      ),
    );
  }
}
