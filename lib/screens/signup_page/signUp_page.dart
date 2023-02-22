import 'package:flutter/material.dart';
import 'package:assign_1/screens/reuseWidget/reuse_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signup extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  TextEditingController name_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController confirmpass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const view_design(
              label: "Create Account",
              height: 200,
            ),
            SizedBox(
              height: 5.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    textfield(label: "Name", icon: Icons.abc, disabled: false,Tcontroller: name_controller),
                    textfield(
                        label: "User-Name",
                        icon: Icons.account_circle_sharp,
                        disabled: false,Tcontroller: username_controller),
                    textfield(
                        label: "E-mail", icon: Icons.email, disabled: false,Tcontroller: email_controller),
                    textfield(
                        label: "Password",
                        icon: Icons.remove_red_eye_outlined,
                        disabled: true,Tcontroller: pass_controller),
                    textfield(
                        label: "Confirm-Password",
                        icon: Icons.remove_red_eye_outlined,
                        disabled: true,Tcontroller: confirmpass_controller),
                  ],
                )),
            buttons(
              label: "Create Account",
              navigation: "home-page",
              formKey: _formKey,
              Econtroller: email_controller,
              Pcontroller: pass_controller,
            ),
          ],
        ),
      ),
    );
  }
}
