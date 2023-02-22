import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/resources/resources.dart';
import '../home_page/homePage.dart';
import '../login_page/loginPage.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigate_Login();
  }

  void Navigate_Login() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(time, () {});
    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return const home_page();
        },
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return const login_page();
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
                GradientColorManager.g1_color,
                GradientColorManager.g2_color
              ])),
          child: Center(
              child: Text(
            "Zignuts Technolab",
            style:
                getTextStyle(33.sp, "Orbitron", GradientColorManager.g3_color),
          )),
        ),
      ),
    );
  }
}
