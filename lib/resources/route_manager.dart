
import 'package:assign_1/screens/college_View/college_search.dart';
import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';


// this are the all the routes which are  available in project
final Map<String, WidgetBuilder> routes = {
  SplashScreen.id:(context) => const SplashScreen(),
  LoginPage.id:(context)=> const LoginPage(),
  SignUp.id:(context)=> SignUp(),
  HomePage.id:(context) =>const HomePage(),
  ForgetPass.id:(context) =>ForgetPass(),
  UserLoyalCard.id:(context) =>const UserLoyalCard(),
  SearchSection.id:(context) =>  SearchSection(),
  CollegeList.id:(context) => CollegeList(),
  "userDataField":(context)=>UserDataField(label: "New Card",value: "Save"),
};

// this is the navigatin key that used to navigate from one page to another page with using the context
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}