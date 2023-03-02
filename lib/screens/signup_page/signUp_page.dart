import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resoureces.dart';

class SignUp extends StatelessWidget {
  static const id = "Sign-up";

  static TextEditingController nameController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController confirmPassController = TextEditingController();

  final List dataField = [
    {
      "label": "Name",
      "icon": Icons.abc,
      "disabled": false,
      "tController": nameController
    },
    {
      "label": "User-Name",
      "icon": Icons.email,
      "disabled": false,
      "tController": usernameController
    },
    {
      "label": "E-mail",
      "icon": Icons.email,
      "disabled": false,
      "tController": emailController
    },
    {
      "label": "Name",
      "icon": Icons.remove_red_eye_outlined,
      "disabled": true,
      "tController": passController
    },
    {
      "label": "Name",
      "icon": Icons.remove_red_eye_outlined,
      "disabled": true,
      "tController": passController
    },
  ];
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
                key: FormService.formKey,
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
              formKey: FormService.formKey,
              eController: emailController,
              pController: passController,
            ),
          ],
        ),
      ),
    );
  }
}
