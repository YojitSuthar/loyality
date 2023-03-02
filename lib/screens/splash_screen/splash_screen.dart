import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resoureces.dart';

class SplashScreen extends StatefulWidget {
  static const String id="SplashScreen";
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
      Navigator.of(context).pushReplacementNamed(HomePage.id);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.id);
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
                fontSizeFamilyColorTextStyle(33.sp, "Orbitron", GradientColorManager.g3Color),
          )),
        ),
      ),
    );
  }
}
