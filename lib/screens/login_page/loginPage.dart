import 'package:assign_1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/screens/reuseWidget/reuse_widget.dart';

class login_page extends StatefulWidget {
  static String id="login_page";
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            view_design(label: "Zignuts Technolab",height: 330),
            SizedBox(
              height: 10.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    textfield(
                        label: "E-mail", icon: Icons.email, disabled: false,Tcontroller: email_controller),
                    textfield(
                        label: "Password", icon: Icons.lock, disabled: true,Tcontroller: pass_controller),
                    buttons(
                      label: "Sign-In",
                      navigation: "home-page",
                      formKey: _formKey,
                      Econtroller: email_controller,
                      Pcontroller: pass_controller,
                    ),
                  ],
                )),
            buttons(
              label: "Sign-up",
              navigation: "Signup",
              formKey: _formKey,
            ),
            SizedBox(
              height: 5.h,
            ),
          /*  GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,  "forgetPass");
              },
              child: Text("Forgot password ?",style: getTextStyle(15.sp, "Madurai", ColorManager.teal),),
            )*/
          ],
        ),
      ),
    );
  }
}





