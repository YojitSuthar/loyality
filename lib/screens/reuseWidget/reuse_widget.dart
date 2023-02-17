import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../authentication/authfile.dart';

class textfield extends StatelessWidget {
  late final String label;
  final IconData? icon;
  final bool disabled;
  final TextEditingController Tcontroller;
  textfield(
      {required this.label,
      required this.icon,
      required this.disabled,
      required this.Tcontroller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).r,
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: GradientColorManager.g2_color),
          borderRadius: BorderRadius.circular(14.w)),
      child: TextFormField(
        controller: Tcontroller,
        textInputAction: TextInputAction.none,
        validator: (value) {
          if (label == "Password" || label == "Confirm-Password") {
            if (value == null || value.isEmpty) {
              return 'Please enter text';
            } else if (value.length < 8) {
              return 'Please enter more than 8 characters';
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
          hintText: "$label",
          contentPadding: EdgeInsets.only(left: 15).r,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class buttons extends StatelessWidget {
  late final String label;
  late final String navigation;
  final GlobalKey<FormState> formKey;
  TextEditingController? Econtroller;
  TextEditingController? Pcontroller;

  buttons(
      {required this.label,
      required this.navigation,
      required this.formKey,
      this.Econtroller,
      this.Pcontroller});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (navigation == "Signup") {
            Navigator.pushNamed(context, "$navigation");
          } else if (formKey.currentState!.validate() &&
              label == "Create Account") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account is created')),
            );
            Fire_base().signup(Econtroller!, Pcontroller!);
          } else if (label == "Sign-In") {
            debugPrint("Sign-In");
            Fire_base().singIn(Econtroller!, Pcontroller!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Successfully signed in')),
            );
          } else if (label == "Reset-password") {
            Fire_base().forget_password(Econtroller!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password reset')),
            );
          } else {
            if (formKey.currentState!.validate()) {
              Navigator.pushNamed(context, "$navigation");
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
            "$label",
            style: getTextStyle(20.sp, "Madurai", ColorManager.white),
          )),
        ));
  }
}

class view_design extends StatelessWidget {
  late final String label;
  final int height;
  view_design({
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
                GradientColorManager.g1_color,
                GradientColorManager.g2_color
              ]),
          borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30).w,
                  bottomLeft: Radius.circular(30))
              .w,
        ),
        child: Center(
          child: Text(
            "$label",
            style:
                getTextStyle(33.sp, "Orbitron", GradientColorManager.g3_color),
          ),
        ),
      ),
    );
  }
}
