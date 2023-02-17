import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:assign_1/screens/login_page/loginPage.dart';

class home_page extends StatefulWidget {
  static String id = "home_page";

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int index = 0;

  final user = FirebaseAuth.instance.currentUser!;
  final pages = [
    const Page1(),
    const Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home Page"),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 80,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    user.email!,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.paypal),
            title: Text("PayPal"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.home_work_outlined),
            title: Text("Addr"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.key),
            title: Text("Password"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new login_page();
                    },
                  )));
            },
          ),
        ],
      )),
      body: pages[index],
      bottomNavigationBar: bottumBar(),
    );
  }

  Container bottumBar() {
    return Container(
      height: 62.h,
      decoration: BoxDecoration(
          color: GradientColorManager.g2_color,
          borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))
              .w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: ColorManager.teal,
                      size: 30.r,
                    )),
                Text(
                  "HOME",
                  style: newgetTextStyle(
                      12.sp, FontWeightManager.semiBold, ColorManager.teal),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    icon: Icon(
                      Icons.group,
                      color: ColorManager.teal,
                      size: 30.r,
                    )),
                Text(
                  "VENDORS",
                  style: newgetTextStyle(
                      12.sp, FontWeightManager.semiBold, ColorManager.teal),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: Icon(
                      Icons.list,
                      color: ColorManager.teal,
                      size: 30.r,
                    )),
                Text(
                  "LIST",
                  style: newgetTextStyle(
                      12.sp, FontWeightManager.semiBold, ColorManager.teal),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: Icon(
                      Icons.category_outlined,
                      color: ColorManager.teal,
                      size: 30.r,
                    )),
                Text(
                  "CATEGORIES",
                  style: newgetTextStyle(
                      12.sp, FontWeightManager.semiBold, ColorManager.teal),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: ColorManager.teal,
                      size: 30.r,
                    )),
                Text(
                  "MORE",
                  style: newgetTextStyle(
                      12.sp, FontWeightManager.semiBold, ColorManager.teal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.home),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.people),
      ),
    );
  }
}
