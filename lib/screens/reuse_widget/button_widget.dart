import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resoureces.dart';

/*
Button reuse widget, we use this button for Sign-in ,Sign-out,create account , we specify cases on their label which provide on button name and perform
different action on particular button
*/

class Buttons extends StatelessWidget {
  late final String label;
  String? navigation;
  final GlobalKey<FormState> formKey;
  TextEditingController? eController;
  TextEditingController? pController;

  Buttons(
      {super.key,
      required this.label,
       this.navigation,
      required this.formKey,
      this.eController,
      this.pController});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (label == "Sign-up") {
            Navigator.pushNamed(context, SignUp.id);
          }

          else if (formKey.currentState!.validate() && label == "Create Account") {
            try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(email: eController!.text.trim(), password: pController!.text.trim());
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("account already exists")));
            }
          }

          else if (label == "Sign-In") {
            FireBase().singIn(eController!, pController!);
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
            style: fontSizeFamilyColorTextStyle(20.sp, "Madurai", ColorManager.white),
          )),
        ));
  }
}


