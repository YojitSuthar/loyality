import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../reuseWidget/reuse_widget.dart';

class ForgetPass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
            key: _formKey,
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
                  formKey: _formKey,
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
