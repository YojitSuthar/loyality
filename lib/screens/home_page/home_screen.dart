import 'package:assign_1/screens/college_View/college_search.dart';
import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  static var dbUser = FirebaseFirestore.instance.collection("Users");
  static final currentUser = FirebaseAuth.instance.currentUser?.email;
  final pages = [
    const Page1(),
  ];
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    checkUser();
  }

  void checkUser() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!)
        .get()
        .then((DocumentSnapshot user) {
      if (user.exists) {
        print(user['Email']);
      } else {
        print("Not Found");
        final newUser = <String, dynamic>{"Email": currentUser!};
        dbUser.add(newUser);
        // dbUser.doc(currentUser).set(newUser);
        print(newUser.toString());
      }
    });
  }

  signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      NavigationService.navigatorKey.currentState!
          .pushReplacementNamed(LoginPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          Container(
            width: 265.w,
            height: 180.h,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25),
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
                    margin: const EdgeInsets.only(bottom: 10).r,
                    child: Text(
                      currentUser!,
                      style: const TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: Option.drawerOption.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Option.drawerOption[index]["title"],
                    leading: Option.drawerOption[index]["leading"],
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const LoginPage();
                            },
                          )));
                    },
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.home_work_outlined),
            title: const Text("Search College"),
            onTap: () {Navigator.pushNamed(context, SearchSection.id);   },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  )));
            },
          ),
        ],
      )),
      body: pages[index],
      bottomNavigationBar: bottumBar(),
      floatingActionButton: TextButton(
        onPressed: () {},
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: ColorManager.green,
          child: Image.asset(
            IconAssets.chatIcon,
            fit: BoxFit.cover,
            height: 50.h,
          ),
        ),
      ),
    );
  }

  Container bottumBar() {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: ColorManager.black),
          borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))
              .w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
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
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "HOME",
                style: fontSizeWeightColorTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.group,
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "VENDORS",
                style: fontSizeWeightColorTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.list,
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "LIST",
                style: fontSizeWeightColorTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: Icon(
                    Icons.category_outlined,
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "CATEGORIES",
                style: fontSizeWeightColorTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemCount: Option.userOption.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return UserOptionTable(
                                              label: Option.userOption[index]
                                                  ["label"],
                                              icon: Option.userOption[index]
                                                  ["icon"]);
                                        })),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(
                    Icons.add,
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "MORE",
                style: fontSizeWeightColorTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
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
    return const Center(
      child: Icon(Icons.home),
    );
  }
}
