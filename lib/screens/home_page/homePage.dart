import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:assign_1/screens/login_page/loginPage.dart';
import '../loyality_card/loyallity_card.dart';
import '../reuseWidget/card.dart';


class HomePage extends StatefulWidget {
  static String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  var dbUser =FirebaseFirestore.instance.collection("Users");
  final currentUser = FirebaseAuth.instance.currentUser?.email;

  final pages = [
    const Page1(),
   // const Page2(),
    loyal_card(),
  ];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    checkUser();
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
          child: ListView(
            children: [
              DrawerHeader(
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
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        currentUser!,
                        style: const TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.paypal),
                title: const Text("PayPal"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home_work_outlined),
                title: const Text("Addr"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.key),
                title: const Text("Password"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return login_page();
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
            IconAssets.chat_icon,
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
                    checkUser();
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
                style: newgetTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Column(
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
                    color: ColorManager.green,
                    size: 30.r,
                  )),
              Text(
                "VENDORS",
                style: newgetTextStyle(
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
                style: newgetTextStyle(
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
                style: newgetTextStyle(
                    12.sp, FontWeightManager.semiBold, ColorManager.green),
              )
            ],
          ),
          Container(

            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      card(
                                          label: "Offers",
                                          icon: Icon(
                                            Icons.local_offer_sharp,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label: "Notification",
                                          icon: Icon(
                                            Icons
                                                .notification_important_outlined,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label: "Coupons and Promos",
                                          icon: Icon(
                                            Icons.card_giftcard_sharp,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                        label: "Loyalty Cards",
                                        icon: Icon(
                                          Icons.credit_card,
                                          color: ColorManager.green,
                                        ),
                                        navigation: "loyal_card",
                                      ),
                                      card(
                                          label: "Purchases",
                                          icon: Icon(
                                            Icons.shopping_bag,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label: "Shopping Tips",
                                          icon: Icon(
                                            Icons.bookmark_add_rounded,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label: "Reports",
                                          icon: Icon(
                                            Icons.report,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label:
                                              "Vendor Accounts & credentials",
                                          icon: Icon(
                                            Icons.account_circle_sharp,
                                            color: ColorManager.green,
                                          )),
                                      card(
                                          label: "Chat",
                                          icon: Icon(
                                            Icons.chat,
                                            color: ColorManager.green,
                                          )),
                                    ],
                                  ),
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
                    style: newgetTextStyle(
                        12.sp, FontWeightManager.semiBold, ColorManager.green),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkUser() async {

    await FirebaseFirestore.instance.collection("Users").doc(currentUser!).get().then((DocumentSnapshot user){
      if(user.exists)
        print(user['Email']);
      else {
        print("Not Found");
        final newUser = <String, String>{
          "Email": currentUser!
        };
        dbUser.add(newUser);
        print(newUser.toString());
      }
    });

    /*await dbUser.doc(currentUser).get().then((DocumentSnapshot snap) async{
        if(snap.exists) {
          print(snap['Email']);
        }
        else {
          final newUser = <String, String>{
            "EMail": currentUser!
          };
          dbUser.add(newUser);
          print(newUser.toString());
          snap['Email'];
        }
    });*/
    //
    // await dbUser.doc(currentUser).get().then((DocumentSnapshot snap) async{
    //   if(snap.exists) {
    //     print(snap['Email']);
    //   }
    // });
    //Future<DocumentSnapshot<Map<String, dynamic>>> _collectionRef =    FirebaseFirestore.instance.collection(currentUser!).doc().get().then((DocumentSnapshot snap){
     // if(snap!=null)
    //  print(snap['program_name']);

   // });

      // Get docs from collection reference
     // print(_collectionRef);
     // QuerySnapshot querySnapshot = await _collectionRef.get();

      // // Get data from docs and convert map to List
      // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      //
      // print(allData);
    //  _getLoyaltyCard()

        // else
        //   print("Not found");





  //  print(users.id);

    // users.doc("Users/${user.email}").forEach((element){
    //
    // });

   //  CollectionReference _collectionRef = FirebaseFirestore.instance.collection('Users');
   //
   //
   //  QuerySnapshot querySnapshot = await _collectionRef.get();
   //  final allData = querySnapshot.docs.map((doc) => doc.data());
   //
   // // print(allData);
   //
   //  allData.forEach((element){
   //    //print("$element  Element");
   //   // print("${user.email}  EMail");
   //   // print(element!["Email"]==user.email  );
   //  });
   //

    //print(temp);
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
