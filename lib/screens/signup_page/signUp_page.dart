import 'package:flutter/material.dart';
import 'package:assign_1/screens/reuseWidget/reuse_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ViewDesign(
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
                    UserTextField(label: "Name", icon: Icons.abc, disabled: false,tController: nameController),
                    UserTextField(
                        label: "User-Name",
                        icon: Icons.account_circle_sharp,
                        disabled: false,tController: usernameController),
                    UserTextField(
                        label: "E-mail", icon: Icons.email, disabled: false,tController: emailController),
                    UserTextField(
                        label: "Password",
                        icon: Icons.remove_red_eye_outlined,
                        disabled: true,tController: passController),
                    UserTextField(
                        label: "Confirm-Password",
                        icon: Icons.remove_red_eye_outlined,
                        disabled: true,tController: confirmPassController),
                  ],
                )),
            Buttons(
              label: "Create Account",
              navigation: "home-page",
              formKey: _formKey,
              eController: emailController,
              pController: passController,
            ),
          ],
        ),
      ),
    );
  }
}
