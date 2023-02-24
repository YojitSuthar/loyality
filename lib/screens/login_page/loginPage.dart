import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/screens/reuseWidget/reuse_widget.dart';

class LoginPage extends StatefulWidget {
  static String id="login_page";

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ViewDesign(label: "Zignuts Technolab",height: 330),
            SizedBox(
              height: 10.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    UserTextField(
                        label: "E-mail", icon: Icons.email, disabled: false,tController: emailController),
                    UserTextField(
                        label: "Password", icon: Icons.lock, disabled: true,tController: passController),
                    Buttons(
                      label: "Sign-In",
                      navigation: "home-page",
                      formKey: _formKey,
                      eController: emailController,
                      pController: passController,
                    ),
                  ],
                )),
            Buttons(
              label: "Sign-up",
              navigation: "Signup",
              formKey: _formKey,
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}





