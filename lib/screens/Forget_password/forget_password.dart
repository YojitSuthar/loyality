import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../reuseWidget/reuse_widget.dart';

class forget_pass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController forgetpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          view_design(
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
                textfield(
                    label: "E-mail",
                    icon: Icons.email,
                    disabled: false,
                    Tcontroller: forgetpass),
                buttons(
                  label: "Reset-password",
                  navigation: "null",
                  formKey: _formKey,
                  Econtroller: forgetpass,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
