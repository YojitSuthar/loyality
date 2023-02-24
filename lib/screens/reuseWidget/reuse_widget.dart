import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../authentication/authfile.dart';
import '../../main.dart';
import '../home_page/home_screen.dart';

class UserTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool disabled;
  final TextEditingController tController;
  const UserTextField(
      {super.key,
      required this.label,
      required this.icon,
      required this.disabled,
      required this.tController});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).r,
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: GradientColorManager.g2Color),
          borderRadius: BorderRadius.circular(14.w)),
      child: TextFormField(
        controller: tController,
        textInputAction: TextInputAction.none,
        validator: (value) {
          if (label == "Password" || label == "Confirm-Password") {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            } else if (value.length < 6) {
              return 'Please enter more than 6 characters';
            }
          } else if (label == "E-mail") {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}')
                .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
          } else {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            }
          }
          return null;
        },
        obscureText: disabled,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorManager.teal,
          ),
          hintText: label,
          contentPadding: const EdgeInsets.only(left: 15).r,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  late final String label;
  late final String navigation;
  final GlobalKey<FormState> formKey;
  TextEditingController? eController;
  TextEditingController? pController;

  Buttons(
      {super.key,
      required this.label,
      required this.navigation,
      required this.formKey,
      this.eController,
      this.pController});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (navigation == "Signup") {
            Navigator.pushNamed(context, navigation);
          } else if (formKey.currentState!.validate() &&
              label == "Create Account") {
            try {
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: eController!.text.trim(),
                      password: pController!.text.trim())
                  .then((value) => navigatorkey.currentState!
                      .pushReplacementNamed(HomePage.id));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("account already exists")));
            }
          } else if (label == "Sign-In") {
            FireBase().singIn(eController!, pController!);
          } else {
            if (formKey.currentState!.validate()) {
              Navigator.pushNamed(context, navigation);
            }
          }
        },
        child: Container(
          width: 200.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: ColorManager.teal,
              boxShadow: [
                BoxShadow(
                    color: ColorManager.black,
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer)
              ],
              borderRadius: BorderRadius.circular(30).w),
          child: Center(
              child: Text(
            label,
            style: getTextStyle(20.sp, "Madurai", ColorManager.white),
          )),
        ));
  }
}

class ViewDesign extends StatelessWidget {
  final String label;
  final int height;
  const ViewDesign({
    super.key,
    required this.label,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: "name",
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                GradientColorManager.g1Color,
                GradientColorManager.g2Color
              ]),
          borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(30).w,
                  bottomLeft: const Radius.circular(30))
              .w,
        ),
        child: Center(
          child: Text(
            label,
            style:
                getTextStyle(33.sp, "Orbitron", GradientColorManager.g3Color),
          ),
        ),
      ),
    );
  }
}
