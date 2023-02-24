import 'package:assign_1/screens/Forget_password/forget_password.dart';
import 'package:assign_1/screens/home_page/homePage.dart';
import 'package:assign_1/screens/login_page/loginPage.dart';
import 'package:assign_1/screens/loyality_card/loyallity_card.dart';
import 'package:assign_1/screens/loyality_card/user_data_textfield.dart';
import 'package:assign_1/screens/signup_page/signUp_page.dart';
import 'package:assign_1/screens/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


final navigatorkey= GlobalKey<NavigatorState>();
class myApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          navigatorKey: navigatorkey,
          debugShowCheckedModeBanner: false,
          initialRoute: "splash",
          routes: {
            "splash":(context) => SplashScreen(),
            LoginPage.id:(context)=> LoginPage(),
            "Signup":(context)=> SignUp(),
            HomePage.id:(context) =>HomePage(),
            "forgetPass":(context) =>ForgetPass(),
            "loyal_card":(context) =>LoyalCard(),
            "userDataField":(context)=>UserDataField(label: "New Card",value: "Save"),
          "EdituserDataField":(context)=>UserDataField(label: "Edit Card",value: "Update"),

          },
        );
      },
    );
  }
}

// void main() =>runApp(myApp());


Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}



