import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';
import 'package:assign_1/resources/resources.dart';

enum MenuOptions {
  Edit,
  Delete,
}
class UserLoyalCard extends StatefulWidget {

  static String id = "UserLoyalCard";
  const UserLoyalCard({super.key});

  @override
  State<UserLoyalCard> createState() => _UserLoyalCardState();
}

class _UserLoyalCardState extends State<UserLoyalCard> {

  bool _showCircle = true;
  LoyalCard cardMainData=LoyalCard();
  LoyaltyCardListModel? model;
  var currentUser=FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
     getLoyaltyCardData();
  }

  //function works to get user data form database and display the data on the card
  Future<void> getLoyaltyCardData() async {
    var currentUser=FirebaseAuth.instance.currentUser?.email;
    await FirebaseFirestore.instance.collection(currentUser!).get().then((QuerySnapshot carddata){
      Map<String,dynamic> maindata={};
      List<Map<String, dynamic>>? list = [];
      list = carddata.docs.map((doc) => doc.data() ).cast<Map<String, dynamic>>().toList();
      maindata.addAll({"list": list});
      setState(() {
        model= LoyaltyCardListModel.fromJson(maindata);
        _showCircle = !_showCircle;
      });
    });
  }
  // Function work to delete the existing data from the database
  Future<void> removeCard(String index) async {
      await FirebaseFirestore.instance.collection(currentUser!).doc(index).delete().then((value) => debugPrint("done"));
 }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration:  BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(color: ColorManager.black, blurStyle: BlurStyle.inner)
                ],
              ),
              margin: const EdgeInsets.only(top: 5).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5).r,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ), onPressed: () { Navigator.pop(context);},
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Loyalty Cards",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10).r,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Icon(
                              Icons.document_scanner_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ).r,
                    child: Row(
                      children: [
                        Container(
                          //It show the loaction of the shop
                          margin: const EdgeInsets.only(
                            left: 1,
                            top: 5,
                          ).r,
                          height: 23.h,
                          child: Image.asset(
                            //image of location icon
                            IconAssets.locationIcon,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Johan - TW12 44GH - Londan",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: (!_showCircle)? showGridView(): Text("Nothing is here"),
              ),
            ),
            _showCircle ? const CircularProgressIndicator() : const CircularProgressIndicator(value: 0.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.green,
        onPressed: () {
          Navigator.pushNamed(context, 'userDataField').then(onGoBack);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
      _showCircle = !_showCircle;
        getLoyaltyCardData();
    });
  }

  showGridView() {
    return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 6 / 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: model?.list?.length, //cardd.list?.length,
        itemBuilder: (BuildContext ctx, index) {
          return Column(
            children: [
              Expanded(
                child: Card(
                  color: Colors.green[500],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton<MenuOptions>(
                            icon: const Icon(Icons.more_vert),
                            position: PopupMenuPosition.under,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onSelected: (MenuOption)  {
                              if(MenuOption==MenuOptions.Edit){
                                final id=model?.list![index].id??'id';
                                Route route = MaterialPageRoute(builder: (context) => UserDataField(label: "Edit Card",value: "Update",id: id));
                                Navigator.push(context, route).then(onGoBack);
                              } else if(MenuOption==MenuOptions.Delete){
                                setState(() {
                                  removeCard(model?.list![index].id??'');
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserLoyalCard())).then((value) => onGoBack);
                                });
                              }
                            },
                            itemBuilder: (BuildContext context) =>[
                               PopupMenuItem(value: MenuOptions.Edit,child: Text('Edit',style: TextStyle(color:  ColorManager.green),),),
                              const PopupMenuDivider(height: 1,),
                               PopupMenuItem(
                                value: MenuOptions.Delete,
                                child:  Text("Delete",style: TextStyle(color:  ColorManager.lightGreen),),
                              ),
                            ],
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Text(model?.list![index].programName![0].toUpperCase()??'Program Name',style: const TextStyle(fontSize: 50),),
                      )
                    ],
                  ),
                ),
              ),
              Text(model?.list![index].programName??''),
              //  Text(cardMainData[index].programName),
            ],
          );
        });
  }
}







