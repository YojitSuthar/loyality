import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resoureces.dart';

class ForgetPass extends StatelessWidget {
  static const String id="ForgetPassword";
  TextEditingController forgetPass = TextEditingController();
  ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ViewDesign(
            label: "Forget Password",
            height: 200,
          ),
          SizedBox(
            height: 10.h,
          ),
          Form(
            key: FormService.formKey,
            child: Column(
              children: [
                UserTextField(
                    label: "E-mail",
                    icon: Icons.email,
                    disabled: false,
                    tController: forgetPass),
                Buttons(
                  label: "Reset-password",
                  navigation: "null",
                  formKey: FormService.formKey,
                  eController: forgetPass,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
